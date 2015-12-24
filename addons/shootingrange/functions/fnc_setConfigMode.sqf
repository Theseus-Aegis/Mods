/*
 * Author: Jonpas
 * Sets shooting course target change event.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Target Change Event (1 = Time, 2 = Hit) <NUMBER>
 * 2: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, [target1, target2]] call tac_shootingrange_fnc_setConfigMode;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_mode", "_targets"];

{
    _x setVariable [QGVAR(mode), _mode, true];
} forEach _targets;

// Notification
private _textEvent = localize LSTRING(Timed);
if (_mode == 2) then {
    _textEvent = localize LSTRING(Hit);
};

private _text = format ["%1%2 %3<br/><br/>%4:<br/>%5", localize LSTRING(Range), _name, localize LSTRING(Configured), localize LSTRING(Mode), _textEvent];
[_text, 3.5] call ACE_Common_fnc_displayTextStructured;
