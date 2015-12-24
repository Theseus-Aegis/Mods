/*
 * Author: Jonpas
 * Adds shooting range countdown times configuration child interactions to a controller.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Countdown Times <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", controller, [controller1, controller2], [6, 9]] call tac_shootingrange_fnc_addConfigCountdownTimes;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_controller", "_controllers", "_countdownTimes"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigCountdownTime%1), _forEachIndex + 1],
            format ["%1 %2", _x, localize LSTRING(Seconds)],
            "",
            {(_this select 2) call FUNC(setConfigCountdownTime)},
            {true},
            {},
            [_name, _controllers, _x]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _controller
    ];
} forEach _countdownTimes;

TRACE_1("Children actions",_actions);

_actions
