/*
 * Author: DaC, Jonpas
 * Toggles vehicle crew security.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call tac_air_security_fnc_setSecurity
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

if (locked _vehicle < 2) then {
    [QGVAR(setLock), [_vehicle, "LOCKED"], _vehicle] call CBA_fnc_targetEvent;
    [localize LSTRING(Secured), QPATHTOF(UI\secure_ca.paa)] call ACEFUNC(common,displayTextPicture);
    _vehicle setVariable [QGVAR(lockedByUs), true, true]; // Only allow unlocking if locked through this function
} else {
    [QGVAR(setLock), [_vehicle, "UNLOCKED"], _vehicle] call CBA_fnc_targetEvent;
    [localize LSTRING(Unsecured), QPATHTOF(UI\unsecure_ca.paa)] call ACEFUNC(common,displayTextPicture);
    _vehicle setVariable [QGVAR(lockedByUs), false, true];
};
