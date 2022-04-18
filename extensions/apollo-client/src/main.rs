mod lib;

use crate::lib::*;

fn main() {
    init();

    println!("Version: {}", version());

    //get_training_identifiers(String::from("76561198048995566"));
    //load_player(String::from("76561198048995566"), true);

    //load_armory(String::from("item"), String::from("76561198048995566"), false);
    get_accessible_item_classes(String::from("76561198048995566"));

    if get() != "error" {
        while get() != "done" {}
    }
}
