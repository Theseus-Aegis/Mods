#include "script_component.hpp"
/*
 * Author: Jonpas
 * Sets shooting course pause duration.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controllers <ARRAY>
 * 2: Countdown Time <NUMBER>
 * 3: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [controller1, controller2], 9, [target1, target2]] call tac_shootingrange_fnc_setConfigCountdownTime;
 *
 * Public: No
 */

params ["_name", "_controllers", "_countdownTime", "_targets"];

{
    _x setVariable [QGVAR(countdownTime), _countdownTime, true];
} forEach _controllers;

// Notification
[_controllers select 0, _name, _targets] call FUNC(checkConfig);
