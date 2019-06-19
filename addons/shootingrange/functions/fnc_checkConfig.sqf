#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks current shooting range configuration
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Name <STRING>
 * 2: Targets <ARRAY> (unused)
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, "range", [target1, target2]] call tac_shootingrange_fnc_checkConfig;
 *
 * Public: No
 */

params ["_controller", "_name", ""];

private _duration = _controller getVariable [QGVAR(duration), DURATION_DEFAULT];
private _targetAmount = _controller getVariable [QGVAR(targetAmount), TARGETAMOUNT_DEFAULT];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), PAUSEDURATION_DEFAULT];
private _countdownTime = _controller getVariable [QGVAR(countdownTime), COUNTDOWNTIME_DEFAULT];
private _mode = _controller getVariable [QGVAR(mode), MODE_DEFAULT];

private _textMode = "";
private _textConfig = localize LSTRING(Duration);
private _textDurationOrTargetAmount = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);

switch (_mode) do {
    case 1: {
        _textMode = localize LSTRING(Timed);
    };
    case 2: {
        _textMode = localize LSTRING(HitTimeLimit);
    };
    case 3: {
        _textMode = localize LSTRING(HitTargetLimit);
        _textConfig = localize LSTRING(TargetAmount);
        _textDurationOrTargetAmount = _targetAmount;
    };
    case 4: {
        _textMode = localize LSTRING(Trigger);
        _textConfig = localize LSTRING(TargetAmount);
        _textDurationOrTargetAmount = _targetAmount;
    };
    case 5: {
        _textMode = localize LSTRING(Rampage);
    };
    default {
        _textMode = "ERORR";
        _textConfig = "ERROR",
        _textDurationOrTargetAmount = "ERROR"
    };
};

private _text = "";
private _size = 4;

if (_mode == 1) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7<br/>%8: %9s<br/>%10: %11s", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Mode), _textMode, _textConfig, _textDurationOrTargetAmount, localize LSTRING(PauseDuration), _pauseDuration, localize LSTRING(CountdownTime), _countdownTime];
    _size = _size + 0.5;
};

if (_mode in [2, 3, 5]) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7<br/>%8: %9s", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Mode), _textMode, _textConfig, _textDurationOrTargetAmount, localize LSTRING(CountdownTime), _countdownTime];
};

if (_mode == 4) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s", localize LSTRING(Range), _name, localize LSTRING(Configuration), localize LSTRING(Mode), _textMode, localize LSTRING(CountdownTime), _countdownTime];
    _size = _size - 0.5;
};

[_text, _size] call ACEFUNC(common,displayTextStructured);
