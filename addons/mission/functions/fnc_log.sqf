#include "script_component.hpp"
/*
 * Author: Mike
 * Function based logging for 3DEN / Server
 * Call from Functions
 *
 * Shows in-game warning and logs to RPT, optional logging to server/client RPT
 *
 * Arguments:
 * 0: Function Name <STRING>
 * 1: Error Message <STRING>
 * 2: Log to RPT <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["[TAC Mission X]:", format ["Undefined value %1", _value]] call FUNC(log)
 */

params ["_functionName", "_message", ["_logToRPT", false]];

private _message = [_functionName, _message] joinString " ";

if (is3DENPreview) then {
    _message call CBA_fnc_notify;
    diag_log _message;
} else {
    if (_logToRPT) then {
        diag_log _message;
    };
};
