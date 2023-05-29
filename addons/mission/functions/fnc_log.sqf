#include "script_component.hpp"
/*
 * Author: Mike
 * Function based logging for 3DEN / Server
 * Call from Functions
 *
 * Shows in-game warning and logs to RPT.
 *
 * Arguments:
 * 0: Function Name <STRING>
 * 1: Error Message <STRING>
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["[TAC Mission X]:", format ["Undefined value %1", _value]] call FUNC(log)
 */

params ["_functionName", "_message"];

private _message = [_functionName, _message] joinString " ";

if (is3DENPreview) then {
    _message call CBA_fnc_notify;
    diag_log _message;
} else {
    diag_log _message;
};
