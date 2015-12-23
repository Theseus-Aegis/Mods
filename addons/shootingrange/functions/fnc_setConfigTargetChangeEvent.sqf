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
 * [1, [target1, target2]] call tac_shootingrange_fnc_setConfigTargetChangeEvent;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_targetChangeEvent", "_targets"];

{
    _x setVariable [QGVAR(targetChangeEvent), _targetChangeEvent, true];
} forEach _targets;

// Notification
private _textEvent = localize LSTRING(Time);
if (_targetChangeEvent == 2) then {
    _textEvent = localize LSTRING(Hit);
};

private _text = format ["%1%2 %3<br/><br/>%4:<br/>%5", localize LSTRING(Range), _name, localize LSTRING(Configured), localize LSTRING(TargetChangeEvent), _textEvent];
[_text, 3.5] call ACE_Common_fnc_displayTextStructured;
