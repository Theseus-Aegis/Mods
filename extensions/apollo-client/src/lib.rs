use std::fs::{File, create_dir_all};
use std::path::Path;
use std::sync::{LazyLock, Mutex};

use arma_rs::{arma, Extension};
use reqwest::blocking::Client;
use log::{LevelFilter, info};
use simplelog::{CombinedLogger, TermLogger, WriteLogger, Config, TerminalMode, ColorChoice};

/// The websites (overridden by `APOLLO_LIVE_URL` and `APOLLO_DEV_URL`, the same variables as
/// apollo-server): the live one, used only when the server uses it (`live`), and the development
/// one for every other server and for testing without a server. Players don't set these, so the
/// usual websites are built in.
pub const LIVE_WEBSITE: &str = "https://www.theseus-aegis.com";
pub const DEV_WEBSITE: &str = "https://srv.theseus-aegis.com/minotaur";
/// Minotaur's Apollo API for players, on that website.
pub const API_PATH: &str = "/apollo/v1/client";
const LOG_PATH: &str = "./logs/tac_apollo_client.log";
const EXT_RET_BYTES: usize = (20480 - 8) / 8; // Size used by Arma 3 as of 2022-04-18

/// A response too long for one return, handed out in parts by `get`.
struct Queue {
    text: String,
    just_emptied: bool,
}

static QUEUE: Mutex<Queue> = Mutex::new(Queue { text: String::new(), just_emptied: false });
static CLIENT: LazyLock<Client> = LazyLock::new(Client::new);
static LIVE_ENDPOINT: LazyLock<String> = LazyLock::new(|| endpoint_from(|key| std::env::var(key).ok(), true));
static DEV_ENDPOINT: LazyLock<String> = LazyLock::new(|| endpoint_from(|key| std::env::var(key).ok(), false));

fn queue() -> std::sync::MutexGuard<'static, Queue> {
    QUEUE.lock().unwrap_or_else(|e| e.into_inner())
}

fn endpoint(live: bool) -> &'static str {
    if live { &LIVE_ENDPOINT } else { &DEV_ENDPOINT }
}

/// The live (`live`) or development website's player API, without a trailing slash.
fn endpoint_from(var: impl Fn(&str) -> Option<String>, live: bool) -> String {
    let (key, default) = if live { ("APOLLO_LIVE_URL", LIVE_WEBSITE) } else { ("APOLLO_DEV_URL", DEV_WEBSITE) };
    let website = var(key).map(|v| v.trim().to_string()).filter(|v| !v.is_empty()).unwrap_or_else(|| default.to_string());
    format!("{}{API_PATH}", website.trim_end_matches('/'))
}

macro_rules! url {
    ($live:expr, $($args:expr),*) => {{
        let mut requrl: String = String::from(endpoint($live));
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
            let Ok(mut response) = v.text() else {
                info!("Request error: unreadable response");
                return String::from("error");
            };

            // Replace non-ASCII characters with a warning
            response = response.replace(|c: char| !c.is_ascii(), "[INVALID-CHAR]");

            info!("Response ({} bytes): {}", response.len(), response);
            if response.len() <= EXT_RET_BYTES {
                info!("Direct response");
                response
            } else {
                queue().text = response;
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
    init_logging(LevelFilter::Info);

    Extension::build()
        .version(env!("CARGO_PKG_VERSION").to_string())
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
    init_logging(LevelFilter::Trace);
}

/// To the terminal and `LOG_PATH`; without the log file (or when already set up), as it can.
fn init_logging(level: LevelFilter) {
    let log_path = Path::new(LOG_PATH);
    let mut loggers: Vec<Box<dyn simplelog::SharedLogger>> =
        vec![TermLogger::new(level, Config::default(), TerminalMode::Mixed, ColorChoice::Auto)];
    if create_dir_all(log_path.parent().unwrap()).is_ok()
        && let Ok(file) = File::create(log_path)
    {
        loggers.push(WriteLogger::new(level, Config::default(), file));
    }
    let _ = CombinedLogger::init(loggers);
}

// Each takes `live`: the server uses the live website (otherwise the development one).

/// The player's locker (all, or one category), as [class, sub-category, description, quantity] entries.
pub fn load_armory(category: String, player_id: String, live: bool) -> String {
    request(url!(live, player_id, "locker", category))
}

/// The player's kits (prepared on the website): [[id, name, ready, [[class, quantity, in locker], ...]], ...].
pub fn load_kits(player_id: String, live: bool) -> String {
    request(url!(live, player_id, "kits"))
}

/// [direction, position, loadout, selected weapon, variables] as last saved (passed through as is).
pub fn load_player(player_id: String, live: bool) -> String {
    request(url!(live, player_id, "loadout"))
}

pub fn get_accessible_item_classes(player_id: String, live: bool) -> String {
    request(url!(live, player_id, "items"))
}

pub fn get_training_identifiers(player_id: String, live: bool) -> String {
    request(url!(live, player_id, "trainings"))
}

pub fn get() -> String {
    let mut queue = queue();
    if queue.text.is_empty() {
        if queue.just_emptied {
            queue.just_emptied = false;
            info!("Get: done");
            String::from("done")
        } else {
            info!("Get: error");
            String::from("error")
        }
    } else {
        let at = std::cmp::min(EXT_RET_BYTES, queue.text.len());
        let rest = queue.text.split_off(at);
        let part = std::mem::replace(&mut queue.text, rest);

        if queue.text.is_empty() {
            queue.just_emptied = true;
        }

        info!("Get: {} bytes", part.len());
        part
    }
}

pub fn version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::{Read, Write};
    use std::net::TcpListener;
    use std::thread;

    /// The queue is shared, so tests that use it take turns.
    static TURN: Mutex<()> = Mutex::new(());

    fn turn() -> std::sync::MutexGuard<'static, ()> {
        TURN.lock().unwrap_or_else(|e| e.into_inner())
    }

    fn endpoint_with(vars: &[(&str, &str)], live: bool) -> String {
        endpoint_from(|key| vars.iter().find(|(k, _)| *k == key).map(|(_, v)| v.to_string()), live)
    }

    /// A one-request web server answering `body`; returns its address and what was requested.
    fn serve(body: &'static str) -> (String, thread::JoinHandle<String>) {
        let listener = TcpListener::bind("127.0.0.1:0").unwrap();
        let address = format!("http://{}", listener.local_addr().unwrap());
        let handle = thread::spawn(move || {
            let (mut stream, _) = listener.accept().unwrap();
            let mut request = [0; 4096];
            let n = stream.read(&mut request).unwrap();
            let line = String::from_utf8_lossy(&request[..n]).lines().next().unwrap_or("").to_string();
            write!(stream, "HTTP/1.1 200 OK\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
                   body.len()).unwrap();
            line
        });
        (address, handle)
    }

    #[test]
    fn usual_websites_by_default() {
        assert_eq!(endpoint_with(&[], true), "https://www.theseus-aegis.com/apollo/v1/client");
        assert_eq!(endpoint_with(&[], false), "https://srv.theseus-aegis.com/minotaur/apollo/v1/client");
        assert_eq!(endpoint_with(&[("APOLLO_LIVE_URL", "  ")], true), format!("{LIVE_WEBSITE}{API_PATH}"));
    }

    #[test]
    fn websites_overridden() {
        let vars = [("APOLLO_LIVE_URL", "https://example.com/"), ("APOLLO_DEV_URL", "http://localhost:8001")];
        assert_eq!(endpoint_with(&vars, true), "https://example.com/apollo/v1/client");
        assert_eq!(endpoint_with(&vars, false), "http://localhost:8001/apollo/v1/client");
        assert_eq!(endpoint_with(&vars[1..], true), format!("{LIVE_WEBSITE}{API_PATH}")); // only dev's set
    }

    #[test]
    fn urls() {
        assert_eq!(url!(true, "765", "locker", "rifle"), format!("{}/765/locker/rifle", endpoint(true)));
        assert_eq!(url!(false, "765", "kits"), format!("{}/765/kits", endpoint(false)));
    }

    #[test]
    fn short_response_directly() {
        let _turn = turn();
        let (address, server) = serve("[[\"arifle_MX_F\",\"Rifle\",\"MX\",2]]");
        assert_eq!(request(format!("{address}/apollo/v1/client/765/locker/rifle")),
                   "[[\"arifle_MX_F\",\"Rifle\",\"MX\",2]]");
        assert_eq!(server.join().unwrap(), "GET /apollo/v1/client/765/locker/rifle HTTP/1.1");
        assert_eq!(get(), "error"); // nothing queued
    }

    #[test]
    fn long_response_in_parts() {
        let _turn = turn();
        let body: &'static str = Box::leak("x".repeat(EXT_RET_BYTES * 2 + 10).into_boxed_str());
        let (address, server) = serve(body);
        assert_eq!(request(format!("{address}/loadout")), "queued");
        server.join().unwrap();
        let parts: Vec<String> = (0..3).map(|_| get()).collect();
        assert_eq!(parts.iter().map(String::len).collect::<Vec<_>>(), [EXT_RET_BYTES, EXT_RET_BYTES, 10]);
        assert_eq!(parts.concat(), body);
        assert_eq!(get(), "done");
        assert_eq!(get(), "error");
    }

    #[test]
    fn non_ascii_replaced() {
        let _turn = turn();
        let (address, server) = serve("[\"Žiga\",\"12 Ŧ\"]");
        assert_eq!(request(format!("{address}/x")), "[\"[INVALID-CHAR]iga\",\"12 [INVALID-CHAR]\"]");
        server.join().unwrap();
    }

    #[test]
    fn unreachable_website_is_an_error() {
        let _turn = turn();
        let port = TcpListener::bind("127.0.0.1:0").unwrap().local_addr().unwrap().port(); // closed again
        assert_eq!(request(format!("http://127.0.0.1:{port}/x")), "error");
    }

    #[test]
    fn commands() {
        let _turn = turn();
        let extension = init().testing();
        let (version, code) = extension.call("version", None);
        assert_eq!((version.as_str(), code), (env!("CARGO_PKG_VERSION"), 0));
        let (reply, _) = extension.call("get", None);
        assert_eq!(reply, "error");
    }
}
