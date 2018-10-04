#include "script_component.hpp"
/*
 * Author: Jonpas
 * Starts Attach or Detach process.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [heli] call tac_heavylifter_fnc_progress
 *
 * Public: No
 */

params ["_vehicle"];

if (isNil {_vehicle getVariable QGVAR(prepared)}) then {
    [HEAVYLIFTER_PREP_TIME, [_vehicle], {(_this select 0) call FUNC(prepare)}, {}, localize LSTRING(Attaching)] call ACEFUNC(common,progressBar);
} else {
    [HEAVYLIFTER_PREP_TIME, [_vehicle], {(_this select 0) call FUNC(unprepare)}, {}, localize LSTRING(Detaching)] call ACEFUNC(common,progressBar);
};
