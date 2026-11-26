//! Apollo's game-server commands, answering as Apollo did, with Minotaur as the backend.
//!
//! What only matters while the game server runs stays here, as it did in Apollo's memory:
//! whether a player may be saved yet, and the queues of website replies (data, read with parseSimpleArray) the game fetches one
//! by one (locker actions, vehicles to recreate). Saves are sent in the background, in order,
//! so the game doesn't wait for them.

use std::collections::hash_map::RandomState;
use std::collections::{HashMap, VecDeque};
use std::hash::{BuildHasher, Hasher};
use std::sync::mpsc::{channel, Sender};
use std::sync::{Arc, Mutex};
use std::thread;
use std::time::{Duration, Instant, SystemTime};

use log::{error, info, warn};
use serde_json::{json, Map, Value};

use crate::backend::Backend;

/// Apollo kicked a player after this many saves that came before their load was confirmed.
const BOOT_AFTER_ATTEMPTS: u32 = 3;
/// Apollo's setup time: vehicles count as loaded this long after they were requested.
const VEHICLE_SETUP: Duration = Duration::from_secs(60);
const RETRY_AFTER: Duration = Duration::from_secs(2);
const DONE: &str = "done";
const ERROR: &str = "error";

/// Apollo's CanSave: saving starts once the player's load was validated.
#[derive(Default)]
struct CanSave {
    can_save: bool,
    attempts: u32,
}

#[derive(Default)]
struct State {
    can_save: HashMap<String, CanSave>,
    locker_queues: HashMap<String, VecDeque<String>>,
    vehicle_ids: VecDeque<String>,
    vehicles: HashMap<String, VecDeque<String>>,
    vehicles_requested: Option<Instant>,
}

struct Job {
    path: String,
    body: Value,
}

pub struct Handler<B: Backend> {
    backend: Arc<B>,
    state: Mutex<State>,
    saves: Mutex<Sender<Job>>,
}

impl<B: Backend> Handler<B> {
    pub fn new(backend: B) -> Self {
        let backend = Arc::new(backend);
        let (sender, receiver) = channel::<Job>();
        let worker = Arc::clone(&backend);
        thread::spawn(move || {
            for job in receiver {
                if let Err(e) = worker.post(&job.path, &job.body) {
                    warn!("Save to {} failed ({e}), retrying", job.path);
                    thread::sleep(RETRY_AFTER);
                    if let Err(e) = worker.post(&job.path, &job.body) {
                        error!("Save to {} failed again, not saved: {e}", job.path);
                    }
                }
            }
        });
        Self { backend, state: Mutex::new(State::default()), saves: Mutex::new(sender) }
    }

    fn state(&self) -> std::sync::MutexGuard<'_, State> {
        self.state.lock().unwrap_or_else(|e| e.into_inner())
    }

    fn save_later(&self, path: String, body: Value) {
        if self.saves.lock().unwrap_or_else(|e| e.into_inner()).send(Job { path, body }).is_err() {
            error!("Save queue stopped; not saved");
        }
    }

    /// "none", "done" or "error" (Apollo's resetServer).
    pub fn reset_server(&self, players: String, vehicles: String, server: String, map: String, mission: String) -> String {
        let body = json!({"players": players, "vehicles": vehicles, "server": server, "map": map, "mission": mission});
        self.backend.post("/reset", &body).unwrap_or_else(|e| {
            error!("resetServer: {e}");
            ERROR.into()
        })
    }

    /// Apollo's storeInfantry: "success" for a validation, "completed" when saved, or
    /// "rejected"/"terminated" while the player's load isn't confirmed (the game kicks a
    /// player on "terminated").
    #[allow(clippy::too_many_arguments)]
    pub fn store_infantry(
        &self, kind: String, id: String, name: String, position: String, direction: String, loadout: String,
        weapon: String, variables: String,
    ) -> String {
        if id.is_empty() {
            return "rejected".into();
        }
        if kind.eq_ignore_ascii_case("validate") {
            return "success".into();
        }
        {
            let mut state = self.state();
            match state.can_save.get_mut(&id) {
                None => {
                    // Never loaded on this server (as Apollo: count it, then terminate).
                    let mut entry = CanSave::default();
                    entry.attempts += 1;
                    let terminate = entry.attempts >= BOOT_AFTER_ATTEMPTS;
                    state.can_save.insert(id.clone(), entry);
                    return if terminate { "rejected" } else { "terminated" }.into();
                }
                Some(entry) if !entry.can_save => {
                    entry.attempts += 1;
                    return if entry.attempts >= BOOT_AFTER_ATTEMPTS { "terminated" } else { "rejected" }.into();
                }
                Some(_) => {}
            }
        }
        let body = json!({"name": name, "position": position, "direction": direction, "loadout": loadout,
                          "weapon": weapon, "variables": variables});
        self.save_later(format!("/players/{id}"), body);
        "completed".into()
    }

    /// The player's load was validated: saving may start.
    pub fn infantry_loaded(&self, id: String) -> String {
        self.state().can_save.insert(id, CanSave { can_save: true, attempts: 0 });
        DONE.into()
    }

    /// Log the death and clear the player's state; saving waits for the next load. The death's
    /// key (also its bodybag's ID), the loadout and the variables at the moment of death are
    /// logged with it.
    pub fn player_died(&self, id: String, death_key: String, loadout: String, variables: String) -> String {
        self.state().can_save.insert(id.clone(), CanSave::default());
        let body = json!({"death_key": death_key, "loadout": loadout, "variables": variables});
        if let Err(e) = self.backend.post(&format!("/players/{id}/died"), &body) {
            error!("playerDied {id}: {e}");
        }
        DONE.into() // as Apollo: the game respawns the player either way
    }

    /// Put an item into the member's locker or take one out. "ready": fetch the reply
    /// with retrieve_locker_queue; "error": refused. `partial`: putting magazines in, the rounds
    /// of the partly used ones among them (`[12,3]`), the rest full.
    #[allow(clippy::too_many_arguments)]
    pub fn locker_action(
        &self, action: String, id: String, item: String, box_class: String, quantity: String, keep_magazines: String,
        partial: String,
    ) -> String {
        let body = json!({"action": action, "item": item, "box": box_class, "quantity": quantity,
                          "keep_magazines": keep_magazines, "partial": partial});
        self.queue_locker(&format!("/locker/{id}"), &body, id, &format!("lockerAction {action} {item}"))
    }

    /// Take a kit (prepared on the website) from the member's locker into the box: of each of
    /// its items what the locker has. "ready": fetch the reply with retrieve_locker_queue.
    pub fn locker_take_kit(&self, kit: String, id: String) -> String {
        self.queue_locker(&format!("/kits/{id}"), &json!({"kit": kit}), id, &format!("lockerTakeKit {kit}"))
    }

    /// A bodybag sent from base ("Return to owner"): its contents (`[["class", n], …]`) wait on
    /// the website for the owner. The reply is the website's Arma array (`["ok", owner, n, lost]`,
    /// `["already", owner]`, `["gone", owner]`, `["error", why]`), or "error".
    pub fn bodybag_return(&self, id: String, death_key: String, contents: String) -> String {
        let body = json!({"death_key": death_key, "contents": contents});
        match self.backend.post(&format!("/bodybags/{id}"), &body) {
            Ok(reply) => reply,
            Err(e) => {
                error!("bodybagReturn {id} {death_key}: {e}");
                ERROR.into()
            }
        }
    }

    fn queue_locker(&self, path: &str, body: &Value, id: String, what: &str) -> String {
        let replies = match self.backend.post(path, body) {
            Ok(text) => serde_json::from_str::<Vec<String>>(&text).map_err(|e| e.to_string()),
            Err(e) => Err(e),
        };
        match replies {
            Ok(mut replies) => {
                replies.push(DONE.into());
                self.state().locker_queues.insert(id, replies.into());
                "ready".into()
            }
            Err(e) => {
                info!("{what} for {id} refused: {e}");
                ERROR.into()
            }
        }
    }

    pub fn retrieve_locker_queue(&self, id: String) -> String {
        let mut state = self.state();
        let next = state.locker_queues.get_mut(&id).and_then(VecDeque::pop_front);
        match next {
            Some(reply) => {
                if reply == DONE {
                    state.locker_queues.remove(&id);
                }
                reply
            }
            None => ERROR.into(),
        }
    }

    /// Fetch every saved vehicle; then get_vehicle_list gives their IDs and get_vehicle
    /// each one's data in pieces (the game joins them), both ending with "done".
    pub fn retrieve_all_vehicles(&self) -> String {
        let vehicles = self.backend.get("/vehicles").and_then(|text| {
            serde_json::from_str::<Map<String, Value>>(&text).map_err(|e| e.to_string())
        });
        let vehicles = match vehicles {
            Ok(v) => v,
            Err(e) => {
                error!("retrieveAllVehicles: {e}");
                return ERROR.into();
            }
        };
        let mut state = self.state();
        state.vehicle_ids.clear();
        state.vehicles.clear();
        for (id, pieces) in vehicles {
            let mut queue: VecDeque<String> = pieces
                .as_array()
                .map(|a| a.iter().filter_map(|s| s.as_str().map(String::from)).collect())
                .unwrap_or_default();
            queue.push_back(DONE.into());
            state.vehicle_ids.push_back(id.clone());
            state.vehicles.insert(id, queue);
        }
        state.vehicle_ids.push_back(DONE.into());
        state.vehicles_requested = Some(Instant::now());
        info!("{} vehicles to load", state.vehicles.len());
        "ready".into()
    }

    pub fn get_vehicle_list(&self) -> String {
        self.state().vehicle_ids.pop_front().unwrap_or_else(|| DONE.into())
    }

    pub fn get_vehicle(&self, id: String) -> String {
        self.state().vehicles.get_mut(&id).and_then(VecDeque::pop_front).unwrap_or_else(|| ERROR.into())
    }

    pub fn is_vehicles_all_loaded(&self) -> String {
        let loaded = self.state().vehicles_requested.is_some_and(|t| t.elapsed() >= VEHICLE_SETUP);
        loaded.to_string()
    }

    /// Save a vehicle in the background: `data` is fnc_vehicleSingletonSave's `[key, value]` pairs
    /// as text, passed on as they are (Minotaur reads them), so new keys need no new extension.
    pub fn store_vehicle(&self, id: String, data: String) -> String {
        self.save_later(format!("/vehicles/{id}"), json!({"data": data}));
        "Store vehicle called".into()
    }

    /// Remove a vehicle that no longer exists (deleted, a static weapon packed up), in the same
    /// background queue as the saves, so it comes after any save still waiting.
    pub fn remove_vehicle(&self, id: String) -> String {
        self.save_later(format!("/vehicles/{id}/remove"), json!({}));
        "Remove vehicle called".into()
    }
}

/// "TAC" and ten random letters (Apollo's generateUniqueID), for new persistent objects.
pub fn generate_unique_id() -> String {
    const LETTERS: &[u8] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    let nanos = SystemTime::now().duration_since(SystemTime::UNIX_EPOCH).map(|d| d.as_nanos()).unwrap_or(0);
    let mut id = String::from("TAC");
    for i in 0..10u32 {
        let mut hasher = RandomState::new().build_hasher();
        hasher.write_u128(nanos);
        hasher.write_u32(i);
        id.push(LETTERS[(hasher.finish() % LETTERS.len() as u64) as usize] as char);
    }
    id
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::Mutex as StdMutex;

    #[derive(Default)]
    struct Fake {
        calls: StdMutex<Vec<(String, Value)>>,
        replies: StdMutex<HashMap<String, Result<String, String>>>,
    }

    impl Fake {
        fn reply(self, path: &str, reply: Result<&str, &str>) -> Self {
            self.replies.lock().unwrap().insert(path.into(), reply.map(String::from).map_err(String::from));
            self
        }
    }

    impl Backend for Arc<Fake> {
        fn get(&self, path: &str) -> Result<String, String> {
            self.calls.lock().unwrap().push((format!("GET {path}"), Value::Null));
            self.replies.lock().unwrap().get(path).cloned().unwrap_or(Err("404".into()))
        }
        fn post(&self, path: &str, body: &Value) -> Result<String, String> {
            self.calls.lock().unwrap().push((format!("POST {path}"), body.clone()));
            self.replies.lock().unwrap().get(path).cloned().unwrap_or(Ok("done".into()))
        }
    }

    fn handler(fake: Fake) -> (Handler<Arc<Fake>>, Arc<Fake>) {
        let fake = Arc::new(fake);
        (Handler::new(Arc::clone(&fake)), fake)
    }

    fn wait_for_calls(fake: &Fake, n: usize) -> Vec<(String, Value)> {
        for _ in 0..200 {
            if fake.calls.lock().unwrap().len() >= n {
                break;
            }
            thread::sleep(Duration::from_millis(5));
        }
        fake.calls.lock().unwrap().clone()
    }

    fn s(v: &str) -> String {
        v.to_string()
    }

    #[test]
    fn saving_waits_for_the_load() {
        let (h, fake) = handler(Fake::default());
        let save = |h: &Handler<Arc<Fake>>| {
            h.store_infantry(s("save"), s("765"), s("Jon"), s("[1,2,3]"), s("90"), s("[]"), s(""), s("[]"))
        };
        assert_eq!(h.store_infantry(s("validate"), s("765"), s(""), s(""), s(""), s(""), s(""), s("")), "success");
        assert_eq!(h.store_infantry(s("save"), s(""), s(""), s(""), s(""), s(""), s(""), s("")), "rejected");
        assert_eq!(save(&h), "terminated"); // never loaded here
        assert_eq!(save(&h), "rejected");
        assert_eq!(save(&h), "terminated"); // third attempt
        assert_eq!(h.infantry_loaded(s("765")), "done");
        assert_eq!(save(&h), "completed");
        let calls = wait_for_calls(&fake, 1);
        assert_eq!(calls[0].0, "POST /players/765");
        assert_eq!(calls[0].1["position"], "[1,2,3]");
        assert_eq!(h.player_died(s("765"), s(""), s(""), s("")), "done");
        assert_eq!(save(&h), "rejected"); // dead: waits for the next load
    }

    #[test]
    fn locker_queue() {
        let (h, fake) = handler(Fake::default().reply("/locker/765", Ok(r#"["_container addItemCargoGlobal  [\"x\",1];"]"#)));
        assert_eq!(h.locker_action(s("remove"), s("765"), s("x"), s(""), s("1"), s("false"), s("[12,3]")), "ready");
        assert_eq!(fake.calls.lock().unwrap()[0].1["partial"], "[12,3]");
        assert_eq!(h.retrieve_locker_queue(s("765")), "_container addItemCargoGlobal  [\"x\",1];");
        assert_eq!(h.retrieve_locker_queue(s("765")), "done");
        assert_eq!(h.retrieve_locker_queue(s("765")), "error");
        let (h, _) = handler(Fake::default().reply("/locker/765", Err("409: error")));
        assert_eq!(h.locker_action(s("put"), s("765"), s("x"), s("x"), s("1"), s("false"), s("[12]")), "error");
    }

    #[test]
    fn died_and_bodybag() {
        let (h, fake) = handler(Fake::default().reply("/players/765/died", Ok("done"))
            .reply("/bodybags/765", Ok(r#"["ok","Jon",2,[]]"#)));
        assert_eq!(h.player_died(s("765"), s("765-20261114"), s("[[],[]]"), s(r#"[["earplugs",true]]"#)), "done");
        assert_eq!(fake.calls.lock().unwrap()[0].1["death_key"], "765-20261114");
        assert_eq!(fake.calls.lock().unwrap()[0].1["loadout"], "[[],[]]");
        assert_eq!(fake.calls.lock().unwrap()[0].1["variables"], r#"[["earplugs",true]]"#);
        assert_eq!(h.bodybag_return(s("765"), s("765-20261114"), s(r#"[["x",2]]"#)), r#"["ok","Jon",2,[]]"#);
        assert_eq!(fake.calls.lock().unwrap()[1].1["contents"], r#"[["x",2]]"#);
        let (h, _) = handler(Fake::default().reply("/bodybags/765", Err("400: error")));
        assert_eq!(h.bodybag_return(s("765"), s("k"), s("[")), "error");
    }

    #[test]
    fn kit_queue() {
        let (h, fake) = handler(Fake::default().reply("/kits/765", Ok(r#"["a;", "b;"]"#)));
        assert_eq!(h.locker_take_kit(s("12"), s("765")), "ready");
        assert_eq!(fake.calls.lock().unwrap()[0].1["kit"], "12");
        assert_eq!(h.retrieve_locker_queue(s("765")), "a;");
        assert_eq!(h.retrieve_locker_queue(s("765")), "b;");
        assert_eq!(h.retrieve_locker_queue(s("765")), "done");
        let (h, _) = handler(Fake::default().reply("/kits/765", Ok("[]")));
        assert_eq!(h.locker_take_kit(s("12"), s("765")), "ready"); // nothing in the locker: just done
        assert_eq!(h.retrieve_locker_queue(s("765")), "done");
        let (h, _) = handler(Fake::default().reply("/kits/765", Err("409: error")));
        assert_eq!(h.locker_take_kit(s("12"), s("765")), "error");
    }

    #[test]
    fn vehicles() {
        let (h, _) = handler(Fake::default().reply("/vehicles", Ok(r#"{"TACa": ["TACa setFuel 1.0;"], "TACb": []}"#)));
        assert_eq!(h.is_vehicles_all_loaded(), "false");
        assert_eq!(h.retrieve_all_vehicles(), "ready");
        let mut ids = vec![h.get_vehicle_list(), h.get_vehicle_list()];
        ids.sort();
        assert_eq!(ids, ["TACa", "TACb"]);
        assert_eq!(h.get_vehicle_list(), "done");
        assert_eq!(h.get_vehicle(s("TACa")), "TACa setFuel 1.0;");
        assert_eq!(h.get_vehicle(s("TACa")), "done");
        assert_eq!(h.get_vehicle(s("TACb")), "done");
        assert_eq!(h.get_vehicle(s("TACx")), "error");
        let (h, _) = handler(Fake::default());
        assert_eq!(h.retrieve_all_vehicles(), "error");
    }

    #[test]
    fn vehicle_save_and_removal_are_sent_in_the_background_in_order() {
        let (h, fake) = handler(Fake::default());
        let data = r#"[["type","B_MRAP_01_F"],["ace_cargo",["ACE_Wheel"]]]"#;
        assert_eq!(h.store_vehicle(s("TACa"), s(data)), "Store vehicle called");
        assert_eq!(h.remove_vehicle(s("TACa")), "Remove vehicle called");
        let calls = wait_for_calls(&fake, 2);
        assert_eq!(calls[0].0, "POST /vehicles/TACa");
        assert_eq!(calls[0].1, json!({"data": data}));
        assert_eq!(calls[1], ("POST /vehicles/TACa/remove".into(), json!({})));
    }

    #[test]
    fn unique_ids() {
        let id = generate_unique_id();
        assert_eq!(id.len(), 13);
        assert!(id.starts_with("TAC") && id[3..].chars().all(|c| c.is_ascii_alphabetic()));
        assert_ne!(generate_unique_id(), generate_unique_id());
    }
}
