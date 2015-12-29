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
#include "script_component.hpp"

params ["_target", "_state"];

// Find oval target
private _index = OVAL_TARGETS find (typeOf _target);

TRACE_3("Animate",_target,_state,_index);


private _fnc_animate = {
    params ["_target", "_state", "_anim"];
    private _timeStart = diag_tickTime;
    [{
        params ["_target", "_state", "_anim", "_timeStart"];
        private _neededState = [0, 1] select (_state == 0);
        (_target animationPhase _anim == _neededState) || (_timeStart + 0.5 <= diag_tickTime);
    }, {
        params ["_target", "_state", "_anim"];
        _target animate [_anim, _state];
    }, [_target, _state, _anim, _timeStart]] call ACE_Common_fnc_waitUntilAndExecute;
};


if (_index != -1) then {
    // Oval target found
    {
        [_target, _state, _x] call _fnc_animate;
    } forEach (OVAL_TARGET_ANIMS select _index);
} else {
    // Normal target
    [_target, _state, "Terc"] call _fnc_animate;
};
