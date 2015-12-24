/*
 * Author: Jonpas
 * Checks current shooting range configuration
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Name <STRING>
 * 2: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, "range", [target1, target2]] call tac_shootingrange_fnc_checkConfig;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_name", "_targets"];

private _duration = _controller getVariable [QGVAR(configDuration), nil];
private _pauseDuration = _controller getVariable [QGVAR(configPauseDuration), nil];
private _targetChangeEvent = (_targets select 0) getVariable [QGVAR(targetChangeEvent), nil];
if (isNil "_duration" || {isNil "_pauseDuration"} || {isNil "_targetChangeEvent"}) exitWith { ACE_LOGERROR("No configuration found!"); };

if (_targetChangeEvent < 3) then {
    private _textDuration = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
    private _textEvent = [localize LSTRING(Time), localize LSTRING(Hit)] select (_targetChangeEvent == 2);

    private _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s<br/>%8:<br/>%9", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Duration), _textDuration, localize LSTRING(PauseDuration), _pauseDuration, localize LSTRING(TargetChangeEvent), _textEvent];

    [_text, 4.5] call ACE_Common_fnc_displayTextStructured;
} else {
    private _text = format ["%1 %2 %3<br/><br/>%4: %5s<br/>%6:<br/>%7", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(PauseDuration), _pauseDuration, localize LSTRING(TargetChangeEvent), localize LSTRING(Trigger)];

    [_text, 4] call ACE_Common_fnc_displayTextStructured;
};
