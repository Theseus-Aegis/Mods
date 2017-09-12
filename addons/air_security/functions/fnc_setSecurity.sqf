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

if (locked _vehicle < 2) then {
    [QGVAR(setLock), [_vehicle, "LOCKED"], _vehicle] call CBA_fnc_targetEvent;
    [localize LSTRING(Secured), QPATHTOF(UI\secure_ca.paa)] call ACEFUNC(common,displayTextPicture);
} else {
    [QGVAR(setLock), [_vehicle, "UNLOCKED"], _vehicle] call CBA_fnc_targetEvent;
    [localize LSTRING(Unsecured), QPATHTOF(UI\unsecure_ca.paa)] call ACEFUNC(common,displayTextPicture);
};
