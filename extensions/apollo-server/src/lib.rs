//! Apollo Server: the game server's side of Chronos persistence (players, vehicles, lockers),
//! talking to Minotaur's Apollo API. Replaces the `jni` extension and `Apollo.jar`; the commands
//! keep Apollo's names and replies, so the SQF side calls them the same way.
//!
//! Settings: `APOLLO_SERVER_TOKEN` and `APOLLO_SERVER_DEBUG` (test servers use the development
//! website), optionally `APOLLO_SERVER_URL`, or the same in `apollo-server.cfg` next to the
//! server executable (`token = ...`, `debug = true`, `url = ...`); see backend::Config. The
//! token comes from that website's admin (Chronos · Apollo > Game servers).

use std::fs::{create_dir_all, File};
use std::path::Path;
use std::sync::OnceLock;

use arma_rs::{arma, Extension};
use log::{info, LevelFilter};
use simplelog::{Config as LogConfig, WriteLogger};

pub mod backend;
pub mod handler;

use backend::{Config, Http};
use handler::Handler;

const LOG_PATH: &str = "./logs/tac_apollo_server.log";

static HANDLER: OnceLock<Handler<Http>> = OnceLock::new();

fn handler() -> &'static Handler<Http> {
    HANDLER.get_or_init(|| {
        let config = Config::load();
        info!("Minotaur Apollo API at {}{}", config.url, if config.token.is_empty() { " (no token set!)" } else { "" });
        Handler::new(Http::new(config))
    })
}

#[arma]
pub fn init() -> Extension {
    let log_path = Path::new(LOG_PATH);
    if create_dir_all(log_path.parent().unwrap()).is_ok() {
        if let Ok(file) = File::create(log_path) {
            let _ = WriteLogger::init(LevelFilter::Info, LogConfig::default(), file);
        }
    }
    Extension::build()
        .version(env!("CARGO_PKG_VERSION").to_string())
        .command("version", version)
        .command("getServerType", get_server_type)
        .command("resetServer", reset_server)
        .command("storeInfantry", store_infantry)
        .command("infantryLoaded", infantry_loaded)
        .command("playerDied", player_died)
        .command("lockerAction", locker_action)
        .command("lockerTakeKit", locker_take_kit)
        .command("retrieveLockerQueue", retrieve_locker_queue)
        .command("generateUniqueID", generate_unique_id)
        .command("retrieveAllVehicles", retrieve_all_vehicles)
        .command("getVehicleList", get_vehicle_list)
        .command("isVehiclesAllLoaded", is_vehicles_all_loaded)
        .command("getVehicle", get_vehicle)
        .command("storeVehicle", store_vehicle)
        .finish()
}

pub fn version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}

fn get_server_type() -> String {
    handler().get_server_type()
}

fn reset_server(players: String, vehicles: String, server: String, map: String, mission: String) -> String {
    handler().reset_server(players, vehicles, server, map, mission)
}

#[allow(clippy::too_many_arguments)]
fn store_infantry(
    kind: String, id: String, name: String, position: String, direction: String, loadout: String, weapon: String,
    variables: String,
) -> String {
    handler().store_infantry(kind, id, name, position, direction, loadout, weapon, variables)
}

fn infantry_loaded(id: String) -> String {
    handler().infantry_loaded(id)
}

fn player_died(id: String, killed_by: String) -> String {
    handler().player_died(id, killed_by)
}

fn locker_action(
    action: String, id: String, item: String, box_class: String, quantity: String, keep_magazines: String,
) -> String {
    handler().locker_action(action, id, item, box_class, quantity, keep_magazines)
}

fn locker_take_kit(kit: String, id: String) -> String {
    handler().locker_take_kit(kit, id)
}

fn retrieve_locker_queue(id: String) -> String {
    handler().retrieve_locker_queue(id)
}

fn generate_unique_id() -> String {
    handler::generate_unique_id()
}

fn retrieve_all_vehicles() -> String {
    handler().retrieve_all_vehicles()
}

fn get_vehicle_list() -> String {
    handler().get_vehicle_list()
}

fn is_vehicles_all_loaded() -> String {
    handler().is_vehicles_all_loaded()
}

fn get_vehicle(id: String) -> String {
    handler().get_vehicle(id)
}

#[allow(clippy::too_many_arguments)]
fn store_vehicle(
    id: String, position: String, direction: String, vehicle_type: String, vehicle_class: String, alive: String,
    damage: String, hitpoints: String, fuel: String, ammo: String, magazines: String, item_cargo: String,
    weapon_cargo: String, crew: String, backpacks: String, backpack_items: String, backpack_magazines: String,
    backpack_weapons: String, driver: String, name: String, locked: String, customization: String,
) -> String {
    handler().store_vehicle(
        id, position, direction, vehicle_type, vehicle_class, alive, damage, hitpoints, fuel, ammo, magazines,
        item_cargo, weapon_cargo, crew, backpacks, backpack_items, backpack_magazines, backpack_weapons, driver,
        name, locked, customization,
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn commands_take_arma_arguments() {
        let extension = init().testing();
        let (version, _) = extension.call("version", None);
        assert_eq!(version, env!("CARGO_PKG_VERSION"));
        let (id, code) = extension.call("generateUniqueID", None);
        assert_eq!((id.len(), code), (13, 0));
        // Unknown player: no request is made, so this works without Minotaur.
        let args = ["\"save\"", "\"765\"", "\"Jon\"", "\"[1,2,3]\"", "\"90\"", "\"[]\"", "\"\"", "\"[]\""];
        let (reply, code) = extension.call("storeInfantry", Some(args.iter().map(|a| a.to_string()).collect()));
        assert_eq!((reply.as_str(), code), ("terminated", 0));
        let (reply, _) = extension.call("retrieveLockerQueue", Some(vec!["\"765\"".into()]));
        assert_eq!(reply, "error");
    }
}
