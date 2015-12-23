/*
 * Author: Jonpas
 * Adds shooting range pause durations configuration child interactions to a controller.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Pause Durations <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", controller, [controller1, controller2], [1, 2, 3]] call tac_shootingrange_fnc_addConfigPauseDurations;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_controller", "_controllers", "_pauseDurations"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigPauseDuration%1), _forEachIndex + 1],
            format ["%1 %2", _x, localize LSTRING(Seconds)],
            "",
            {(_this select 2) call FUNC(setConfigPauseDuration)},
            {true},
            {},
            [_name, _controllers, _x]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _controller
    ];
} forEach _pauseDurations;

TRACE_1("Children actions",_actions);

_actions
