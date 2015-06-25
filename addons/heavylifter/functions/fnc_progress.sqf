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
 * [heli] call tac_heavylifter_fnc_progress;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_heli);

private ["_time", "_text"];

_text = "";
if (isNil {_heli getVariable QGVAR(prepared)}) then {
    _text = localize LSTRING(Attaching);
    GVAR(function) = FUNC(prepare);
} else {
    _text = localize LSTRING(Detaching);
    GVAR(function) = FUNC(unprepare);
};

[GVAR(prepTime), [_heli], {(_this select 0) call GVAR(function)}, {}, _text] call ace_common_fnc_progressBar;
