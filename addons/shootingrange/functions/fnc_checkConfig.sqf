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

private _duration = _controller getVariable [QGVAR(duration), nil];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), nil];
private _countdownTime = _controller getVariable [QGVAR(countdownTime), nil];
private _mode = (_targets select 0) getVariable [QGVAR(mode), nil];
if (isNil "_duration" || {isNil "_pauseDuration"} || {isNil "_countdownTime"} || {isNil "_mode"}) exitWith { ACE_LOGERROR("No configuration found!"); };

if (_mode < 3) then {
    private _textDuration = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
    private _textEvent = [localize LSTRING(Timed), localize LSTRING(Hit)] select (_mode == 2);

    private _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s<br/>%8: %9s<br/>%10:<br/>%11", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Duration), _textDuration, localize LSTRING(PauseDuration), _pauseDuration, localize LSTRING(CountdownTime), _countdownTime, localize LSTRING(Mode), _textEvent];

    [_text, 5] call ACE_Common_fnc_displayTextStructured;
} else {
    private _text = format ["%1 %2 %3<br/><br/>%4: %5s<br/>%6:<br/>%7", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(CountdownTime), _countdownTime, localize LSTRING(Mode), localize LSTRING(Trigger)];

    [_text, 4] call ACE_Common_fnc_displayTextStructured;
};
