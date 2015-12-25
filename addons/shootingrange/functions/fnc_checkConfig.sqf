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
private _targetAmount = _controller getVariable [QGVAR(targetAmount), nil];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), nil];
private _countdownTime = _controller getVariable [QGVAR(countdownTime), nil];
private _mode = (_targets select 0) getVariable [QGVAR(mode), nil];
if (isNil "_duration" || {isNil "_targetAmount"} || {isNil "_pauseDuration"} || {isNil "_countdownTime"} || {isNil "_mode"}) exitWith { ACE_LOGERROR("No configuration found!"); };

if (_mode < 4) then {
    private _textMode = "";
    private _textConfig = "";
    private _textDurationOrTargetAmount = "";
    switch (_mode) do {
        case 1: {
            _textMode = localize LSTRING(Timed);
            _textConfig = localize LSTRING(Duration);
            _textDurationOrTargetAmount = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 2: {
            _textMode = localize LSTRING(HitTimeLimit);
            _textConfig = localize LSTRING(Duration);
            _textDurationOrTargetAmount = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 3: {
            _textMode = localize LSTRING(HitTargetLimit);
            _textConfig = localize LSTRING(TargetAmount);
            _textDurationOrTargetAmount = _targetAmount;
        };
        default {_textMode = "ERORR"};
    };

    private _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7<br/>%8: %9s<br/>%10: %11s", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Mode), _textMode, _textConfig, _textDurationOrTargetAmount, localize LSTRING(PauseDuration), _pauseDuration, localize LSTRING(CountdownTime), _countdownTime];
    [_text, 4.5] call ACE_Common_fnc_displayTextStructured;
} else {
    private _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Mode), localize LSTRING(Trigger), localize LSTRING(CountdownTime), _countdownTime];

    [_text, 3.5] call ACE_Common_fnc_displayTextStructured;
};
