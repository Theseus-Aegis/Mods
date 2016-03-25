/*
 * Author: Jonpas
 * Check if vehicle radio can played.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Play Radio <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_canPlayRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit"];

if (!isNil {_vehicle getVariable QGVAR(playingRadio)}) exitWith {false};

private _return = false;

{
    if (_vehicle turretUnit _x == _unit && {!(_unit call CBA_fnc_canUseWeapon)}) exitWith {
        _return = true;
    };
} forEach (allTurrets _vehicle);

driver _vehicle == _unit || {_return}
