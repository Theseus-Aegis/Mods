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

PARAMS_2(_vehicle,_unit);

(isNil {_vehicle getVariable QGVAR(playingRadio)} && {driver _vehicle == _unit || {_vehicle turretUnit [0] == _unit}})
