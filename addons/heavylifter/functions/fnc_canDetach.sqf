#include "script_component.hpp"
/*
 * Author: Jonpas
 * Check if the heavy duty hooks can be Detached.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 *
 * Return Value:
 * Can Detach Hooks <BOOL>
 *
 * Example:
 * [object] call tac_heavylifter_fnc_canDetach
 *
 * Public: No
 */

params ["_target"];

(!isNil {_target getVariable QGVAR(prepared)})
