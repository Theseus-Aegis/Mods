//! Against a running Minotaur (not run by default):
//!
//!     APOLLO_SERVER_URL=http://localhost:8000/game/v1/server APOLLO_SERVER_TOKEN=... \
//!     APOLLO_TEST_PLAYER=<a member's Steam ID> APOLLO_TEST_ITEM=<an item class with slot "item"> \
//!     cargo test -p apollo-server-rs --test minotaur -- --ignored
//!
//! Use a test server set up as debug in Minotaur: it changes that player's debug state and locker.

use std::thread::sleep;
use std::time::Duration;

use apollo_server::backend::{Backend, Config, Http};
use apollo_server::handler::{generate_unique_id, Handler};

fn env(name: &str) -> String {
    std::env::var(name).unwrap_or_else(|_| panic!("{name} not set"))
}

#[test]
#[ignore]
fn round_trip() {
    let player = env("APOLLO_TEST_PLAYER");
    let item = env("APOLLO_TEST_ITEM");
    let config = Config::load();
    let check = Http::new(Config::load());
    let h = Handler::new(Http::new(config));
    let s = |v: &str| v.to_string();

    assert_eq!(h.get_server_type(), "debug", "use a debug game server for this test");
    let mission = generate_unique_id();
    assert_eq!(h.reset_server(s("true"), s("true"), s("Test"), s("Altis"), mission.clone()), "done");
    assert_eq!(h.reset_server(s("true"), s("true"), s("Test"), s("Altis"), mission), "none");

    let loadout = r#"[[],[],[],["U_B_CombatUniform_mcam",[["FirstAidKit",2]]],[],[],"H_HelmetB","",[],["ItemMap","","","","",""]]"#;
    assert_eq!(h.infantry_loaded(player.clone()), "done");
    assert_eq!(h.store_infantry(s("save"), player.clone(), s("Test"), s("[1,2,3]"), s("45"), s(loadout), s(""), s("[]")), "completed");
    sleep(Duration::from_millis(500)); // sent in the background

    assert_eq!(h.locker_action(s("put"), player.clone(), item.clone(), item.clone(), s("2"), s("false")), "ready");
    let statement = h.retrieve_locker_queue(player.clone());
    assert!(statement.contains("CBA_fnc_removeItemCargo"), "{statement}");
    assert_eq!(h.retrieve_locker_queue(player.clone()), "done");
    assert_eq!(h.locker_action(s("remove"), player.clone(), item.clone(), s(""), s("2"), s("false")), "ready");
    assert!(h.retrieve_locker_queue(player.clone()).contains("addItemCargoGlobal"));
    assert_eq!(h.locker_action(s("remove"), player.clone(), item, s(""), s("1"), s("false")), "error"); // empty now

    let id = generate_unique_id();
    let v = |x: &str| x.to_string();
    h.store_vehicle(
        id.clone(), v("[100,200,5]"), v("90"), v("B_MRAP_01_F"), v("Car"), v("true"), v("0.1"),
        v(r#"[["HitEngine",0]]"#), v("1"), v("[]"), v(r#"[["SmokeShell"],[2]]"#), v(r#"["FirstAidKit"]"#), v("[]"),
        v("[]"), v("[]"), v("[]"), v("[]"), v("[]"), v(""), v("Hunter"), v("0"), v(""),
    );
    sleep(Duration::from_millis(500));
    assert_eq!(h.retrieve_all_vehicles(), "ready");
    let mut ids = vec![];
    loop {
        let next = h.get_vehicle_list();
        if next == "done" { break; }
        ids.push(next);
    }
    assert!(ids.contains(&id));
    let first = h.get_vehicle(id.clone());
    assert!(first.starts_with(&format!("{id} = createVehicle [\"B_MRAP_01_F\"")), "{first}");

    assert_eq!(h.player_died(player.clone(), s("")), "done");
    // The player API now answers basic gear (checked through the same API with the server token).
    assert!(check.get("").is_ok());
}
