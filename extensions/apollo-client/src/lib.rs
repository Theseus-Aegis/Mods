use std::fs::{File, create_dir_all};
use std::path::Path;

use arma_rs::{arma, Extension};
use reqwest::blocking::Client;
use log::{LevelFilter, info};
use simplelog::{CombinedLogger, TermLogger, WriteLogger, Config, TerminalMode, ColorChoice};

// Minotaur's Apollo API: the live website, or the development one for test (debug) servers.
const LIVE_ENDPOINT: &str = "https://www.theseus-aegis.com/apollo/v1/client";
const DEV_ENDPOINT: &str = "https://srv.theseus-aegis.com/minotaur/apollo/v1/client";
const LOG_PATH: &str = "./logs/tac_apollo.log";
const EXT_RET_BYTES: usize = (20480 - 8) / 8; // Size used by Arma 3 as of 2022-04-18

static mut QUEUE: String = String::new();
static mut QUEUE_JUST_EMPTIED: bool = false;

lazy_static::lazy_static! {
    static ref CLIENT: Client = Client::new();
}

fn endpoint(debug: bool) -> &'static str {
    if debug { DEV_ENDPOINT } else { LIVE_ENDPOINT }
}

macro_rules! url {
    ($debug:expr, $($args:expr),*) => {{
        let mut requrl: String = String::from(endpoint($debug));
        $(
            requrl = format!("{}/{}", requrl, $args);
        )*
        requrl
    }}
}

fn request(api: String) -> String {
    info!("Request: {}", api);
    match CLIENT.get(&api).send() {
        Ok(v) => {
            let mut response = v.text().unwrap();

            // Replace non-ASCII characters with a warning
            response = response.replace(|c: char| !c.is_ascii(), "[INVALID-CHAR]");

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
        },
        Err(e) => {
            info!("Request error: {e:?}");
            String::from("error")
        },
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
        .command("loadKits", load_kits)
        .command("get", get)
        .command("version", version)
        .finish()
}

pub fn init_debug() {
    let log_path = Path::new(LOG_PATH);
    create_dir_all(log_path.parent().unwrap()).unwrap();
    CombinedLogger::init(
        vec![
            TermLogger::new(LevelFilter::Trace, Config::default(), TerminalMode::Mixed, ColorChoice::Auto),
            WriteLogger::new(LevelFilter::Trace, Config::default(), File::create(log_path).unwrap()),
        ]
    ).unwrap();
}

/// The player's locker (all, or one category), as [class, sub-category, description, quantity] entries.
pub fn load_armory(category: String, player_id: String, debug: bool) -> String {
    request(format!("{}?debug={debug}", url!(debug, player_id, "locker", category)))
}

/// The player's kits (prepared on the website): [[id, name, ready, [[class, quantity, in locker], ...]], ...].
pub fn load_kits(player_id: String, debug: bool) -> String {
    request(format!("{}?debug={debug}", url!(debug, player_id, "kits")))
}

/// [direction, position, loadout, selected weapon] as last saved.
pub fn load_player(player_id: String, debug: bool) -> String {
    request(format!("{}?debug={debug}", url!(debug, player_id, "loadout")))
}

/// `debug`: ask the development website (test servers).
pub fn get_accessible_item_classes(player_id: String, debug: bool) -> String {
    request(url!(debug, player_id, "items"))
}

pub fn get_training_identifiers(player_id: String, debug: bool) -> String {
    request(url!(debug, player_id, "trainings"))
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
