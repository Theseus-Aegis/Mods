#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Overall menu manipulation.
 *
 * Arguments:
 * 0: Requested Menu <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["menu"] call tac_armory_fnc_dialogControl
 *
 * Public: No
 */

params ["_requestedMenu"];

// SPECIFIC
if (_requestedMenu == "main") exitWith {
    // Hide All
    for "_x" from STARTPROJECTID to ENDPROJECTID do {
        ctrlShow [_x, false];
    };

    // Show Shared
    {
        ctrlShow [_x, true];
    } forEach [
        BACKGROUND, TITLE,
        BACKFRAME, BACKBTN,
        EXPORTPIC, EXPORTBTN
    ];

    GVAR(selectedCategory) = "main"; // no list: nothing refreshes it (XEH_postInitClient); only Export shows a message here, other messages go to hints
    GVAR(messageDismissable) = false;

    // Set Title
    ctrlSetText [TITLE, LLSTRING(TitleMain)];

    // Show Main
    [true] call FUNC(dialogControl_main);

    // Set Exit
    ["exit"] call FUNC(dialogControl_back);
};

// CATEGORIES
// Hide Main
[false] call FUNC(dialogControl_main);

// Kits (prepared on the website)
if (_requestedMenu == "kits") exitWith {
    ctrlSetText [TITLE, LLSTRING(TitleKits)];
    [] call FUNC(dialogControl_kits);
    ["back"] call FUNC(dialogControl_back);
};

// Set Title
private _titles = createHashMapFromArray [
    ["rifle", LLSTRING(Title_rifle)],
    ["pistol", LLSTRING(Title_pistol)],
    ["launcher", LLSTRING(Title_launcher)],
    ["ammo", LLSTRING(Title_ammo)],
    ["item", LLSTRING(Title_item)],
    ["attachment", LLSTRING(Title_attachment)],
    ["backpack", LLSTRING(Title_backpack)],
    ["wearable", LLSTRING(Title_wearable)],
    ["insignia", LLSTRING(Title_insignia)],
    ["stash", LLSTRING(Title_stash)]
];
ctrlSetText [TITLE, _titles getOrDefault [_requestedMenu, ""]];

// Show List
[_requestedMenu] call FUNC(dialogControl_list);

// Set Back
["back"] call FUNC(dialogControl_back);
