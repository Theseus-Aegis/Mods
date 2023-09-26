#include "..\script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Stops playing music in the vehicle and removes the radio sound source.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_stopRadio
 *
 * Public: No
 */

params ["_vehicle"];

private _source = _vehicle getVariable [QGVAR(source), objNull];
if (isNull _source) exitWith {}; // Killed EH

[QGVAR(stop), [_vehicle, _source]] call CBA_fnc_globalEvent;
