/*
 * Author: Jonpas
 * Check if the heavy duty hooks can be Detached.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Can Detach Hooks <BOOL>
 *
 * Example:
 * [heli, player] call tac_heavylifter_fnc_canDetach;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_heli);

if (!isNil {_heli getVariable QGVAR(prepared)} &&
    {!isEngineOn _heli} &&
    {count (crew _heli) == 0} &&
    {locked _heli < 2}
) exitWith {true};

// Default
false
