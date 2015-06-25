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

private ["_doors", "_newDoorStatus"];

// Doors to be animated
_doors = [
    "door_L","door_R", // UH-80 Ghost Hawk
    "door_back_L","door_back_R", // CH-49 Mohawk
    "door_4_source","door_5_source","door_6_source" // Mi-290 Taru (Pods)
];

PARAMS_1(_vehicle);

if (locked _vehicle < 2) then {
    _vehicle setVehicleLock "LOCKED";
    _newDoorStatus = 0;
    [localize LSTRING(Secured), QUOTE(PATHTOF(UI\secure_ca.paa))] call ACE_FUNC(common,displayTextPicture);
} else {
    _vehicle setVehicleLock "UNLOCKED";
    _newDoorStatus = 1;
    [localize LSTRING(Unsecured), QUOTE(PATHTOF(UI\unsecure_ca.paa))] call ACE_FUNC(common,displayTextPicture);
};

// Animate doors
{
    _vehicle animateDoor [_x, _newDoorStatus];
} forEach _doors;
