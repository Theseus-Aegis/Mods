#include "script_component.hpp"
/*
 * Author: Jonpas
 * Starts Attach or Detach process.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_heavylifter_fnc_progress
 *
 * Public: No
 */

params ["_target"];

if (isNil {_target getVariable QGVAR(prepared)}) then {
    [
        HEAVYLIFTER_PREP_TIME,
        _target,
        {[_this select 0, true] call FUNC(prepare)},
        {},
        localize LSTRING(Attaching)
    ] call ACEFUNC(common,progressBar);
} else {
    [
        HEAVYLIFTER_PREP_TIME,
        _target,
        {[_this select 0, true] call FUNC(unprepare)},
        {},
        localize LSTRING(Detaching)
    ] call ACEFUNC(common,progressBar);
};
