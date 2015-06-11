/*
 * Author: Jonpas
 * Check if helicopter radio can played.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Play Radio <BOOL>
 *
 * Example:
 * [heli, player] call tac_helicopterevents_fnc_canPlayRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_heli,_unit);

if (isNil {_heli getVariable QGVAR(playingRadio)} &&
    {driver _heli == _player ||
        {_heli turretUnit [0] == _player}
    }
) exitWith {true};

// Default
false
