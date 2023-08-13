#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles breaching charge deletion.
 *
 * Arguments:
 * 0: Charge <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_wire, _obstacle] call tac_breaching_fnc_handleBreachDeleted
 *
 * Public: No
 */

params ["_charge"];

if (!local _charge) exitWith {};
TRACE_1("charge deleted",_charge);

private _nearAmmo = _charge nearObjects [QGVAR(BreachingCharge_Ammo), 0.5];
if (_nearAmmo isEqualTo []) then {
    // Delete wire
    private _wire = _charge getVariable [QGVAR(wire), objNull];
    deleteVehicle _wire;
    TRACE_1("wire deleted",_wire);
} else {
    // Fix rotation after arming (target event in case it's someone else's charge)
    private _explosive = _nearAmmo select 0;
    [QGVAR(setVectorUp), [_explosive, [0, -1, 0]], _explosive] call CBA_fnc_targetEvent;
};
