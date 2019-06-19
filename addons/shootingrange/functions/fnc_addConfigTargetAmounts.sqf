#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds shooting range target amounts configuration child interactions to a controller.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Durations <ARRAY>
 * 4: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", controller, [controller1, controller2], [5, 10, 20], [target1, target2]] call tac_shootingrange_fnc_addConfigTargetAmounts;
 *
 * Public: No
 */

params ["_name", "_controller", "_controllers", "_targetAmounts", "_targets"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigTargetAmount%1), _forEachIndex + 1],
            str _x,
            "",
            {(_this select 2) call FUNC(setConfigTargetAmount)},
            {true},
            {},
            [_name, _controllers, _x, _targets]
        ] call ACEFUNC(interact_menu,createAction),
        [],
        _controller // IGNORE_PRIVATE_WARNING(_controller)
    ];
} forEach _targetAmounts;

//TRACE_1("Children actions",_actions);

_actions
