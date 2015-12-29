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
#include "script_component.hpp"

params ["_target", "_state"];

private _targetGroup = _target getVariable [QGVAR(targetGroup), []];
if (_targetGroup isEqualTo []) exitWith { ACE_LOGERROR("Target Group empty!"); };

{
    [_x, _state] call FUNC(animateTarget);
} forEach _targetGroup;
