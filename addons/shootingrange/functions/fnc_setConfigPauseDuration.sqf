/*
 * Author: Jonpas
 * Sets shooting course pause duration.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controllers <ARRAY>
 * 2: Pause Duration <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [controller1, controller2], 5] call tac_shootingrange_fnc_setConfigPauseDuration;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_controllers", "_pauseDuration"];

{
    _x setVariable [QGVAR(configPauseDuration), _pauseDuration, true];
} forEach _controllers;

// Notification
private _text = format ["%1%2 %3<br/><br/>%4: %5", localize LSTRING(Module), _name, localize LSTRING(Configured), localize LSTRING(PauseDuration), _pauseDuration];
[_text, 3] call ACE_Common_fnc_displayTextStructured;
