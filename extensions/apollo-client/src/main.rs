mod lib;

use crate::lib::*;

fn main() {
    init_debug();

    println!("Version: {}", version());

    get_training_identifiers(String::from("76561198324654204")); // Mick
    //get_training_identifiers(String::from("76561198155448656")); // Philippe
    //load_player(String::from("76561198048995566"), true);
    //load_armory(String::from("item"), String::from("76561198048995566"), false);
    //load_armory(String::from("rifle"), String::from("76561198024182729"), false);
    //get_accessible_item_classes(String::from("76561198048995566"));

    if get() != "error" {
        while get() != "done" {}
    }
}
