/*
 * Author: Jonpas
 * Check if helicopter radio can be stopped.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Stop Radio <BOOL>
 *
 * Example:
 * [heli, player] call tac_helicopterevents_fnc_canStopRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_heli,_unit);

private ["_crewPresent", "_crewDead"];

_crewPresent = if (driver _heli != _player || {_heli turretUnit [0] != _player}) then {true} else {false};
_crewDead = if (!alive (driver _heli) && {!alive (_heli turretUnit [0])}) then {true} else {false};

if (!isNil {_heli getVariable QGVAR(playingRadio)} &&
    {_crewPresent || _crewDead}
) exitWith {true};

// Default
false
