#include "script_component.hpp"
/*
 * Author: Jonpas
 * Check if the heavy duty hooks can be Attached.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 *
 * Return Value:
 * Can Attach Hooks <BOOL>
 *
 * Example:
 * [object] call tac_heavylifter_fnc_canAttach
 *
 * Public: No
 */

params ["_target"];

(isNil {_target getVariable QGVAR(prepared)}) &&
{(crew _target) isEqualTo []}
