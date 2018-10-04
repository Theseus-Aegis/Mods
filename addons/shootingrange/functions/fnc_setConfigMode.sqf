#include "script_component.hpp"
/*
 * Author: Jonpas
 * Sets shooting course target change event.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited)) <NUMBER>
 * 4: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", controller, [controller1, controller2], 1, [target1, target2]] call tac_shootingrange_fnc_setConfigMode;
 *
 * Public: No
 */

params ["_name", "_controller", "_controllers", "_mode", "_targets"];

{
    _x setVariable [QGVAR(mode), _mode, true];
} forEach _controllers;

// Notification
[_controller, _name, _targets] call FUNC(checkConfig);
