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


private _fnc_animate = {
    params ["_target", "_state", "_anims"];
    // Wait animation time before changing animation again
    [{
        params ["_target", "_state", "_anims"];
        TRACE_3("Wait Animate",_target,_state,_anims);
        {
            _target animate [_x, _state];
        } forEach _anims;
    }, [_target, _state, _anims], 0.3] call ACE_Common_fnc_waitAndExecute;
};


// Find oval target
private _index = OVAL_TARGETS find (typeOf _target);
TRACE_3("Animate",_target,_state,_index);

if (_index != -1) then {
    // Oval target
    private _anims = [];
    {
        _anims pushBack _x;
    } forEach (OVAL_TARGET_ANIMS select _index);
    [_target, _state, _anims] call _fnc_animate;
} else {
    // Normal target
    [_target, _state, ["Terc"]] call _fnc_animate;
};
