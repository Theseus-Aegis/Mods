/*
 * Author: Jonpas
 * Adds shooting range pause duration interactions to a controller.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Duration <NUMBER>
 * 3: Pause Durations <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], 5, [1, 2, 3]] call tac_shootingrange_fnc_addRangeActionPauseDurations;
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_controller", "_controllers", "_duration", "_pauseDurations"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeStart_%1_%2), _duration, _x],
            format ["%1 %2", _x, localize LSTRING(Seconds)],
            "",
            {(_this select 2) call FUNC(startRange)},
            {true},
            {},
            [_controller, _controllers, _duration, _x]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _controller
    ];
} forEach _pauseDurations;

TRACE_1("Children actions",_actions);

_actions
