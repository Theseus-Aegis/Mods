#include "script_component.hpp"
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
 * [heli, player] call tac_heavylifter_fnc_canDetach
 *
 * Public: No
 */

params ["_vehicle"];

(!isNil {_vehicle getVariable QGVAR(prepared)})
