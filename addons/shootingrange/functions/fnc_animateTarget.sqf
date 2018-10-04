#include "script_component.hpp"
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

params ["_target", "_state"];

private _anims = _target call FUNC(getTargetAnimations);
//TRACE_3("Animate",_target,_state,_anims);
{
    _target animate [_x, _state];
} forEach _anims;
