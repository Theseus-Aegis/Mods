#include "..\script_component.hpp"
/*
 * Author: Mike
 * Logs a message to the RPT log and displays it on-screen in Eden Editor.
 * Call from any function in this component.
 * Should not be used directly, but rather via overwritten CBA macro (<WARNING()>).
 *
 * Arguments:
 * 0: Function File Path <STRING>
 * 1: Type <STRING>
 * 2: Message <STRING>
 *
 * Return Value:
 * None
 *
 * Examples:
 * WARNING("Undefined value");
 * WARNING_2("Undefined value %1, expected %2",_value,_expected);
 */

params ["_file", "_type", "_message"];

// File path to function name
private _name = ((_file splitString "\.") select -2) select [4];

private _messageRPT = format ["[%1] (%2: %3) %4: %5", toUpper 'PREFIX', 'COMPONENT', _name, _type, _message];
private _messageOSD = format ["[%1 %2] %3: %4", toUpper 'PREFIX', _name, _type, _message];

diag_log text _messageRPT;
if (is3DENPreview) then {
    _messageOSD call CBA_fnc_notify;
};
