/*
 * Author: Jonpas
 * Starts shooting range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Name <STRING>
 * 3: Targets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], "range", [target1, target2]] call tac_shootingrange_fnc_start;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_controllers", "_name", "_targets"];

private _duration = _controller getVariable [QGVAR(duration), nil];
private _targetAmount = _controller getVariable [QGVAR(targetAmount), nil];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), nil];
private _countdownTime = _controller getVariable [QGVAR(countdownTime), nil];
private _mode = _controller getVariable [QGVAR(mode), nil];
private _triggers = (_targets select 0) getVariable [QGVAR(triggers), nil];
if (isNil "_duration" || {isNil "_targetAmount"} || {isNil "_pauseDuration"} || {isNil "_countdownTime"} || {isNil "_mode"} || {isNil "_triggers"}) exitWith { ACE_LOGERROR("No configuration found!"); };


// Prepare targets
{
    [_x, 1] call FUNC(animateTarget); // Down
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(running), true, true];
    _x setVariable [QGVAR(starter), ACE_player, true];
} forEach _controllers;


// Started notification (including players in vicinity)
private _playerName = [ACE_player, true] call ACE_Common_fnc_getName;
private _text = "";
private _size = 0;

if (_mode < 4) then {
    private _textConfig = "";
    private _textDurationOrTargetAmount = "";
    switch (_mode) do {
        case 1: {
            _textConfig = localize LSTRING(Duration);
            _textDurationOrTargetAmount = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 2: {
            _textConfig = localize LSTRING(Duration);
            _textDurationOrTargetAmount = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 3: {
            _textConfig = localize LSTRING(TargetAmount);
            _textDurationOrTargetAmount = _targetAmount;
        };
        default {_textMode = "ERORR"};
    };

    if (_mode in [1, 2]) then {
        _text = format ["%1%2 %3<br/><br/>%4: %5<br/>%6: %7s", localize LSTRING(Range), _name, localize LSTRING(Started), _textConfig, _textDurationOrTargetAmount, localize LSTRING(PauseDuration), _pauseDuration];
        _size = 3.5;
    } else {
        _text = format ["%1%2 %3<br/><br/>%4: %5", localize LSTRING(Range), _name, localize LSTRING(Started), _textConfig, _textDurationOrTargetAmount];
        _size = 3;
    };
} else {
    _text = format ["%1%2 %3", localize LSTRING(Range), _name, localize LSTRING(Started)];
    _size = 2;
};

private _size = [_size, _size - 0.5] select (_name isEqualTo "");
[_text, _size] call ACE_Common_fnc_displayTextStructured;

_text = format ["%1<br/><br/>%2: %3", _text, localize LSTRING(By), _playerName];
[_text, _size + 1, false] call FUNC(notifyVicinity);


// Prepare variables
GVAR(targetNumber) = 0;
GVAR(maxScore) = 0;

if (_mode > 1) then {
    // Player count bullets fired
    GVAR(firedEHid) = ACE_player addEventHandler ["Fired", { GVAR(maxScore) = GVAR(maxScore) + 1; }];

    if (_mode > 2) then {
        GVAR(timeStartCountdown) = diag_tickTime;

        if (_mode == 4) then {
            {
                _x enableSimulation true;
            } forEach _triggers;

            GVAR(targetGroup) = (_targets select 0) getVariable [QGVAR(targetGroup), nil];
            GVAR(targetGroupIndex) = 0;
        };
    };
} else {
    GVAR(lastPauseTime) = 0;
};

// Countdown timer notifications
{
    _x params ["_execTime", "_textCountdown"];

    [{
        params ["_controller", "_textCountdown"];

        // Exit if not running (eg. stopped)
        if !(_controller getVariable [QGVAR(running), false]) exitWith {};

        // Countdown timer notification
        [_textCountdown] call ACE_Common_fnc_displayTextStructured;

    }, [_controller, _textCountdown], _execTime] call ACE_Common_fnc_waitAndExecute;

} forEach [ [_countdownTime - 5, localize LSTRING(GetReady)], [_countDownTime - 3, "3"], [_countdownTime - 2, "2"], [_countdownTime - 1, "1"] ];

// Start pop-up handling and final countdown notification
[{
    params ["_controller", "_pauseDuration", "_duration", "_targetAmount", "_targets", "_controller", "_controllers", "_name", "_mode", "_triggers"];

    // Exit if not running (eg. stopped)
    if !(_controller getVariable [QGVAR(running), false]) exitWith {};

    // Final countdown notification
    [localize LSTRING(Go)] call ACE_Common_fnc_displayTextStructured;

    // Notify supervisor(s) (closer than start/stop notifications)
    private _playerName = [ACE_player, true] call ACE_Common_fnc_getName;
    private _textNotify = format ["%1 %2!", _playerName, localize LSTRING(Started)];
    [_textNotify, 1.5, false, NOTIFY_DISTANCE_SUPERVISOR] call FUNC(notifyVicinity);

    // Prepare target pop-up handling
    private _timeStart = diag_tickTime;
    GVAR(firstRun) = true;

    // Disable automatic pop-ups
    nopop = true;

    // Start PFH
    [FUNC(popupPFH), 0, [_timeStart, _duration, _pauseDuration, _targetAmount, _targets, _controller, _controllers, _name, _mode, _triggers]] call CBA_fnc_addPerFrameHandler;

}, [_controller, _pauseDuration, _duration, _targetAmount, _targets, _controller, _controllers, _name, _mode, _triggers], _countdownTime] call ACE_Common_fnc_waitAndExecute;
