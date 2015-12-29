/*
 * Author: Jonpas
 * Animates a target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: State (Up = 0, Down = 1) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, 0] call tac_shootingrange_fnc_animateTarget;
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_target", "_state"];

// Find oval target
private _index = OVAL_TARGETS find (typeOf _target);

TRACE_3("Animate",_target,_state,_index);

if (_index != -1) then {
    // Oval target found
    {
        _target animate [_x, _state];
    } forEach (OVAL_TARGET_ANIMS select _index);
} else {
    // Normal target
    _target animate ["Terc", _state];
};
