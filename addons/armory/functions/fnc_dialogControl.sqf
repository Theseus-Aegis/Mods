#include "script_component.hpp"
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
    } forEach [TITLE, BACKPIC, BACKBTN];

    // Set Title
    ctrlSetText [TITLE, format[QPATHTOF(UI\title_%1.paa), _requestedMenu]];

    // Show Main
    [true] call FUNC(dialogControl_main);

    // Set Exit
    ["exit"] call FUNC(dialogControl_back);
};

// CATEGORIES
// Hide Main
[false] call FUNC(dialogControl_main);

// Set Title
ctrlSetText [TITLE, format [QPATHTOF(UI\titleCategory_%1.paa), _requestedMenu]];

// Show List
[_requestedMenu] call FUNC(dialogControl_list);

// Set Back
["back"] call FUNC(dialogControl_back);
