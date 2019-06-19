#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds shooting range pause durations configuration child interactions to a controller.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Pause Durations <ARRAY>
 * 4: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", controller, [controller1, controller2], [1, 2, 3], [target1, target2]] call tac_shootingrange_fnc_addConfigPauseDurations;
 *
 * Public: No
 */

params ["_name", "_controller", "_controllers", "_pauseDurations", "_targets"];

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
            [_name, _controllers, _x, _targets]
        ] call ACEFUNC(interact_menu,createAction),
        [],
        _controller // IGNORE_PRIVATE_WARNING(_controller)
    ];
} forEach _pauseDurations;

//TRACE_1("Children actions",_actions);

_actions
