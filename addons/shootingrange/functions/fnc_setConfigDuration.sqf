#include "script_component.hpp"
/*
 * Author: Jonpas
 * Sets shooting course duration.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controllers <ARRAY>
 * 2: Duration <NUMBER>
 * 3: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [controller1, controller2], 5, [target1, target2]] call tac_shootingrange_fnc_setConfigDuration;
 *
 * Public: No
 */

params ["_name", "_controllers", "_duration", "_targets"];

{
    _x setVariable [QGVAR(duration), _duration, true];
} forEach _controllers;

// Notification
[_controllers select 0, _name, _targets] call FUNC(checkConfig);
