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
private _targetInvalidGroup = _target getVariable [QGVAR(targetInvalidGroup), []];

if (_targetGroup isEqualTo []) exitWith { ACE_LOGERROR("Target Group empty!"); };

{
    [_x, _state] call FUNC(animateTarget);

    // Mark target hit
    private _hits = [_x getVariable [QGVAR(hits), 1], 0] select (_state == 0);
    _x setVariable [QGVAR(hit), _hits];
} forEach (_targetGroup + _targetInvalidGroup);
