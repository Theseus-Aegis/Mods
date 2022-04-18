use std::fs::{File, create_dir_all};
use std::path::Path;

use arma_rs::{arma, Extension};
use log::{LevelFilter, info};
use simplelog::{CombinedLogger, TermLogger, WriteLogger, Config, TerminalMode, ColorChoice};

const REST_ENDPOINT: &str = "https://theseus-aegis.com:8443/apollo";
const LOG_PATH: &str = "./logs/tac_apollo.log";
const EXT_RET_BYTES: usize = (20480 - 8) / 8; // Size used by Arma 3 as of 2022-04-18

static mut QUEUE: String = String::new();
static mut QUEUE_JUST_EMPTIED: bool = false;

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
    info!("Response ({} bytes): {}", response.len(), response);

    if response.len() <= EXT_RET_BYTES {
        info!("Direct response");
        response
    } else {
        unsafe {
            QUEUE.clear();
            QUEUE = response;
        }
        info!("Queued response (max {} bytes at once)", EXT_RET_BYTES);
        String::from("queued")
    }
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
        .command("get", get)
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

pub fn get() -> String {
    unsafe {
        if QUEUE.is_empty() {
            if QUEUE_JUST_EMPTIED {
                QUEUE_JUST_EMPTIED = false;
                info!("Get: done");
                String::from("done")
            } else {
                info!("Get: error");
                String::from("error")
            }
        } else {
            let mut split = QUEUE.split_off(std::cmp::min(EXT_RET_BYTES, QUEUE.len()));
            std::mem::swap(&mut QUEUE, &mut split);

            if QUEUE.is_empty() {
                QUEUE_JUST_EMPTIED = true;
            }

            info!("Get: {} bytes", split.len());
            split
        }
    }
}

pub fn version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}
