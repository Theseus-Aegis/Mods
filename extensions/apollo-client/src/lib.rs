use std::fs::{File, create_dir_all};
use std::path::Path;

use arma_rs::{arma, Extension};
use log::{LevelFilter, info};
use simplelog::{CombinedLogger, TermLogger, WriteLogger, Config, TerminalMode, ColorChoice};

const REST_ENDPOINT: &str = "https://theseus-aegis.com:8443/apollo";
const LOG_PATH: &str = "./logs/tac_apollo.log";

macro_rules! url {
    ($($args:expr),*) => {{
        let mut requrl: String = String::from(REST_ENDPOINT);
        $(
            requrl = format!("{}/{}", requrl, $args);
        )*
        requrl
    }}
}

fn request(api: String) -> String {
    info!("Request: {}", api);
    let response = reqwest::blocking::get(&api).unwrap().text().unwrap();
    info!("Response: {}", response);
    response
}

#[arma]
pub fn init() -> Extension {
    let log_path = Path::new(LOG_PATH);
    create_dir_all(log_path.parent().unwrap()).unwrap();
    CombinedLogger::init(
        vec![
            TermLogger::new(LevelFilter::Info, Config::default(), TerminalMode::Mixed, ColorChoice::Auto),
            WriteLogger::new(LevelFilter::Info, Config::default(), File::create(log_path).unwrap()),
        ]
    ).unwrap();

    Extension::build()
        .command("loadArmory", load_armory)
        .command("loadPlayer", load_player)
        .command("getAccessibleItemClasses", get_accessible_item_classes)
        .command("getTrainingIdentifiers", get_training_identifiers)
        .command("version", version)
        .finish()
}

pub fn load_armory(category: String, player_id: String, debug: bool) -> String {
    request(url!("armory", category, player_id, debug))
}

pub fn load_player(player_id: String, debug: bool) -> String {
    request(url!("loadInfantry", player_id, debug))
}

pub fn get_accessible_item_classes(player_id: String) -> String {
    request(url!("getAccessibleItemClasses", player_id))
}

pub fn get_training_identifiers(player_id: String) -> String {
    request(url!("getTrainingIdentifiers", player_id))
}

pub fn version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}
