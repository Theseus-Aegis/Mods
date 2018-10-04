#include "script_component.hpp"
/*
 * Author: Jonpas
 * Pops targets on trigger.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: State (Up = 0, Down = 1) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, 0] call tac_shootingrange_fnc_triggerPopup;
 *
 * Public: No
 */

params ["_target", "_state"];

private _targetGroup = _target getVariable [QGVAR(targetGroup), []];

if (_targetGroup isEqualTo []) exitWith { ERROR("Target Group empty!"); };

{
    // Animate only targets that haven't been cleared yet
    if !(_x getVariable [QGVAR(hit), false]) then {
        [_x, _state] call FUNC(animateTarget);
    };
} forEach _targetGroup;

private _targetInvalidGroup = _target getVariable [QGVAR(targetInvalidGroup), []];
{
    [_x, _state] call FUNC(animateTarget);
} forEach _targetInvalidGroup;
