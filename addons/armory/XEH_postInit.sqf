#include "script_component.hpp"

// Talking Armory Boxes
[QGVAR(Locker), "containerOpened", {
    [QGVAR(talkingBoxEvent), [_this select 0]] call CBA_fnc_serverEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(talkingBoxEvent), FUNC(talkingBox)] call CBA_fnc_addEventHandler;

GVAR(boxLines) = [
    "tacr_box_100_quid",
    "tacr_box_business_dog",
    "tacr_box_buy_another",
    "tacr_box_contraband",
    "tacr_box_die_anyway",
    "tacr_box_dire_decisions",
    "tacr_box_dress_up",
    "tacr_box_epr_ammo",
    "tacr_box_fashion_sense",
    "tacr_box_go_out",
    "tacr_box_good_heavens",
    "tacr_box_gpnvgs",
    "tacr_box_grenade_egging",
    "tacr_box_helmet",
    "tacr_box_money_and_needs",
    "tacr_box_more_ammo",
    "tacr_box_reasonably_priced",
    "tacr_box_shambles"
];
