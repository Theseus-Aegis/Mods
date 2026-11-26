//! Against a running Minotaur (not run by default):
//!
//!     APOLLO_DEV_URL=http://localhost:8000 APOLLO_SERVER_TOKEN=... \
//!     APOLLO_TEST_PLAYER=<a member's Steam ID> APOLLO_TEST_ITEM=<an item class with slot "item"> \
//!     cargo test -p apollo-server-rs --test minotaur -- --ignored
//!
//! Use the development website (or a local one): it changes that player's saved state and locker.

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

    let mission = generate_unique_id();
    assert_eq!(h.reset_server(s("true"), s("true"), s("Test"), s("Altis"), mission.clone()), "done");
    assert_eq!(h.reset_server(s("true"), s("true"), s("Test"), s("Altis"), mission), "none");

    let loadout = r#"[[],[],[],["U_B_CombatUniform_mcam",[["FirstAidKit",2]]],[],[],"H_HelmetB","",[],["ItemMap","","","","",""]]"#;
    assert_eq!(h.infantry_loaded(player.clone()), "done");
    assert_eq!(h.store_infantry(s("save"), player.clone(), s("Test"), s("[1,2,3]"), s("45"), s(loadout), s(""), s("[]")), "completed");
    sleep(Duration::from_millis(500)); // sent in the background

    assert_eq!(h.locker_action(s("put"), player.clone(), item.clone(), item.clone(), s("2"), s("false"), s("")), "ready");
    assert_eq!(h.retrieve_locker_queue(player.clone()), "done"); // the game removes what it stashed
    assert_eq!(h.locker_action(s("remove"), player.clone(), item.clone(), s(""), s("2"), s("false"), s("")), "ready");
    let entry = h.retrieve_locker_queue(player.clone()); // data: [class, count, rounds]
    assert_eq!(entry.to_lowercase(), format!("[\"{}\",2,-1]", item.to_lowercase()), "{entry}");
    assert_eq!(h.locker_action(s("remove"), player.clone(), item, s(""), s("1"), s("false"), s("")), "error"); // empty now

    // What fnc_vehicleSingletonSave sends: [key, value] pairs.
    let id = generate_unique_id();
    let removed = generate_unique_id();
    let data = concat!(
        r#"[["position",[100,200,5]],["direction",90],["vector",[[0,1,0],[0,0,1]]],["type","B_MRAP_01_F"],"#,
        r#"["class","Car"],["name","Hunter"],["alive",true],["damage",0.1],["hitpoints",[["HitEngine",0]]],"#,
        r#"["fuel",1],["locked",0],["customization",[["Black",1],[]]],"#,
        r#"["cargo",[["FirstAidKit"],[["SmokeShell",1]],[],[]]],["ace_cargo",["ACE_Wheel"]]]"#,
    );
    h.store_vehicle(id.clone(), s(data));
    h.store_vehicle(removed.clone(), s(data));
    h.remove_vehicle(removed.clone());
    sleep(Duration::from_millis(500));
    assert_eq!(h.retrieve_all_vehicles(), "ready");
    let mut ids = vec![];
    loop {
        let next = h.get_vehicle_list();
        if next == "done" { break; }
        ids.push(next);
    }
    assert!(ids.contains(&id));
    assert!(!ids.contains(&removed));
    let first = h.get_vehicle(id.clone()); // data, in pieces the game joins
    assert!(first.starts_with(r#"[["type","B_MRAP_01_F"],"#), "{first}");
    assert!(first.contains(r#"["customization",[["Black",1],[]]]"#), "{first}");
    assert_eq!(h.get_vehicle(id.clone()), "done");
    assert_eq!(h.player_died(player.clone(), s(""), s(""), s(r#"[["earplugs",true]]"#)), "done");
    // The token is still accepted, and the removed vehicle stays gone.
    assert!(!check.get("/vehicles").unwrap().contains(&removed));
}
