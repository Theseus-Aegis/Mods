#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds shooting range durations configuration child interactions to a controller.
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
 * ["range", controller, [controller1, controller2], [5, 10, 20], [target1, target2]] call tac_shootingrange_fnc_addConfigDurations;
 *
 * Public: No
 */

params ["_name", "_controller", "_controllers", "_durations", "_targets"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigDuration%1), _forEachIndex + 1],
            [
                localize LSTRING(Infinite),
                format ["%1 %2", _x, localize LSTRING(Seconds)]
            ] select (_x > 0),
            "",
            {(_this select 2) call FUNC(setConfigDuration)},
            {true},
            {},
            [_name, _controllers, _x, _targets]
        ] call ACEFUNC(interact_menu,createAction),
        [],
        _controller // IGNORE_PRIVATE_WARNING(_controller)
    ];
} forEach _durations;

//TRACE_1("Children actions",_actions);

_actions
