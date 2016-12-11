/*
 * Author: DaC, Jonpas
 * Closes or opens the vehicle doors and calls lock function on all connected.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call tac_air_security_fnc_setSecurity;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

// Doors to be animated @todo change to dynamic
private _doors = [
    "door_L","door_R", // UH-80 Ghost Hawk
    "door_back_L","door_back_R", // CH-49 Mohawk
    "door_4_source","door_5_source","door_6_source" // Mi-290 Taru (Pods)
];

private _newDoorStatus = 1;

if (locked _vehicle < 2) then {
    [QGVAR(setLock), [_vehicle, "LOCKED"], _vehicle] call CBA_fnc_targetEvent;
    _newDoorStatus = 0;
    [localize LSTRING(Secured), QPATHTOF(UI\secure_ca.paa)] call ACEFUNC(common,displayTextPicture);
} else {
    [QGVAR(setLock), [_vehicle, "UNLOCKED"], _vehicle] call CBA_fnc_targetEvent;
    _newDoorStatus = 1;
    [localize LSTRING(Unsecured), QPATHTOF(UI\unsecure_ca.paa)] call ACEFUNC(common,displayTextPicture);
};

// Animate doors
{
    _vehicle animateDoor [_x, _newDoorStatus];
} forEach _doors;
