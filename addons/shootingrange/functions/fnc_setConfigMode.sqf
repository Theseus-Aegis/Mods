/*
 * Author: Jonpas
 * Sets shooting course target change event.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited)) <NUMBER>
 * 2: Targets <ARRAY>
 * 3: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", 1, [target1, target2], controller] call tac_shootingrange_fnc_setConfigMode;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_mode", "_targets", "_controller"];

{
    _x setVariable [QGVAR(mode), _mode, true];
} forEach _targets;

// Notification
[_controller, _name, _targets] call FUNC(checkConfig);
