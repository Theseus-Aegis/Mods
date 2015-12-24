/*
 * Author: Jonpas
 * Sets shooting course pause duration.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Controllers <ARRAY>
 * 2: Countdown Time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [controller1, controller2], 9] call tac_shootingrange_fnc_setConfigCountdownTime;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_controllers", "_countdownTime"];

{
    _x setVariable [QGVAR(countdownTime), _countdownTime, true];
} forEach _controllers;

// Notification
private _text = format ["%1%2 %3<br/><br/>%4: %5", localize LSTRING(Range), _name, localize LSTRING(Configured), localize LSTRING(CountdownTime), _countdownTime];
[_text, 3] call ACE_Common_fnc_displayTextStructured;
