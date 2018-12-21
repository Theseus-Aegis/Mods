#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if a target is in "down" animation phase.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _isDown = target call tac_shootingrange_fnc_isTargetDown;
 *
 * Public: No
 */

params ["_target"];

private _anims = _target call FUNC(getTargetAnimations);

{
    if (_target animationPhase _x > 0) exitWith {
        true
    };
    false
} forEach _anims;
