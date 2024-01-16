#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles the possibility of talking Armory boxes, It's canon as of Halloween 2023.
 *
 * Arguments:
 * 0: Armory Box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box] call FUNC(talkingBox)
 *
 * Public: No
 */

params ["_box"];

// Handle random chance, setting is defaulted to 7%
if (random 1 > GVAR(talkingBoxes)) exitWith {};

// If ran out of lines, refill the array.
if (GVAR(boxLines) isEqualTo []) then {
    GVAR(boxLines) = +GVAR(boxLinesMain);
};

// Prevent same sound from happening again.
private _selection = selectRandom GVAR(boxLines);
GVAR(boxLines) deleteAt (GVAR(boxLines) find _selection);

[QEGVAR(mission,say3D), [_box, _selection]] call CBA_fnc_globalEvent;
