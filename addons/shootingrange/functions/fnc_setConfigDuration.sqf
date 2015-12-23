/*
 * Author: Jonpas
 * Sets shooting course duration.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controllers <ARRAY>
 * 2: Duration <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [controller1, controller2], 5] call tac_shootingrange_fnc_setConfigDuration;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_controllers", "_duration"];

{
    _x setVariable [QGVAR(configDuration), _duration, true];
} forEach _controllers;

// Notification
private _textDuration = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
private _text = format ["%1%2 %3<br/><br/>%4: %5", localize LSTRING(Range), _name, localize LSTRING(Configured), localize LSTRING(Duration), _textDuration];
[_text, 3] call ACE_Common_fnc_displayTextStructured;
