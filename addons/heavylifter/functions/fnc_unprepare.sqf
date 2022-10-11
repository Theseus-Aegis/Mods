#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Sets the object back to operational state.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 * 1: Called from Interaction Menu <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_heavylifter_fnc_unprepare
 *
 * Public: No
 */

params ["_target", ["_actionCall", true]];

// Get vehicle and helper object objects
(_target getVariable QGVAR(prepared)) params ["_target", "_helper"];

// Remove the helper object
deleteVehicle _helper;

// Remove variable
_target setVariable [QGVAR(prepared), nil, true];

if (_actionCall) then {
    [localize LSTRING(Detached), QPATHTOF(UI\detach_ca.paa)] call ACEFUNC(common,displayTextPicture);
};
