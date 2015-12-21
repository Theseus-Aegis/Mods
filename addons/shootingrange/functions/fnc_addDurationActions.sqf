/*
 * Author: Jonpas
 * Adds shooting range duration interactions to a controller.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Durations <ARRAY>
 * 3: Pause Durations <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], [5, 10, 20], [1, 2, 3]] call tac_shootingrange_fnc_addRangeActionDurations;
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_controller", "_controllers", "_durations", "_pauseDurations"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeStart_%1), _x],
            [
                localize LSTRING(Infinite),
                format ["%1 %2", _x, localize LSTRING(Seconds)]
            ] select (_x > 0),
            "",
            {},
            {true},
            {(_this select 2) call FUNC(addPauseDurationActions)},
            [_controller, _controllers, _x, _pauseDurations]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _controller
    ];
} forEach _durations;

TRACE_1("Children actions",_actions);

_actions
