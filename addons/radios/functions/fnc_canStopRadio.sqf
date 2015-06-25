/*
 * Author: Jonpas
 * Check if vehicle radio can be stopped.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Stop Radio <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_canStopRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_vehicle,_unit);

private ["_crewPresent", "_crewDead"];

_crewPresent = if (driver _vehicle != _unit || {_vehicle turretUnit [0] != _unit}) then {true} else {false};
_crewDead = if (!alive (driver _vehicle) && {!alive (_vehicle turretUnit [0])}) then {true} else {false};

(!isNil {_vehicle getVariable QGVAR(playingRadio)} && {_crewPresent || _crewDead})
