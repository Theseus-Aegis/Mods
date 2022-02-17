use arma_rs::{arma, Extension};

const REST_ENDPOINT: &str = "https://theseus-aegis.com:8443/apollo";

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
    println!("Request: {}", api);
    let response = reqwest::blocking::get(&api).unwrap().text().unwrap();
    println!("Response: {}", response);
    response
}

#[arma]
fn init() -> Extension {
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
