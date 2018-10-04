#include "script_component.hpp"
/*
 * Author: Jonpas
 * Check if vehicle or static radio can played.
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

params ["_vehicle", "_unit"];

// Playing radio
if (!isNil {_vehicle getVariable QGVAR(playingRadio)}) exitWith {false};

// Static radio objects
if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(isRadio)) == 1) exitWith {true};

// Check vehicle seat
private _return = false;
{
    if (_vehicle turretUnit _x == _unit && {!(_unit call CBA_fnc_canUseWeapon)}) exitWith {
        _return = true;
    };
} forEach (allTurrets _vehicle);

driver _vehicle == _unit || {_return}
