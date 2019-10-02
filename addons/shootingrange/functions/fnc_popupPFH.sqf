#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles target pop-ups.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Time Start <NUMBER>
 *   1: Duration <NUMBER>
 *   2: Pause Duration <NUMBER>
 *   3: Target Amount <NUMBER>
 *   4: Targets <ARRAY>
 *   5: Invalid Targets <ARRAY>
 *   6: Controller <OBJECT>
 *   7: Controllers <ARRAY>
 *   8: Name <STRING>
 *   9: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger, 5 = Rampage) <NUMBER>
 *   10: Triggers <ARRAY>
 * 1: Per-Frame Handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ [450, 60, 3, [target1, target2], [invalidTarget1, invalidTarget2], controller, [controller1, controller2], "range", 1, [trigger1, trigger2]], idPFH] call tac_shootingrange_fnc_popupPFH;
 *
 * Public: No
 */

params ["_args", "_idPFH"];
_args params ["_timeStart", "_duration", "_pauseDuration", "_targetAmount", "_targets", "_targetsInvalid", "_controller", "_controllers", "_name", "_mode", "_triggers"];

// Remove if stopped - fail
if (!(_controller getVariable [QGVAR(running), false]) || {GVAR(invalidTargetHit)}) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _targetsInvalid, _mode, false] call FUNC(popupPFHexit);
};

private _currentTime = CBA_missionTime;

// Remove when time limit (duration) reached - success
if (_mode in [1, 2, 5] && {_currentTime >= _timeStart + _duration}) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _targetsInvalid, _mode, true, GVAR(currentScore), GVAR(maxScore)] call FUNC(popupPFHexit);
};

// Remove when all targets hit - success
if ((_mode == 3 && {GVAR(targetNumber) >= _targetAmount}) || {_mode > 3 && {GVAR(targetNumber) >= count _targets}}) exitWith {
    // Round time elapsed to decimal places
    private _timeElapsed = _currentTime - _timeStart;
    _timeElapsed = (str _timeElapsed) splitString ".";
    _timeElapsed = format ["%1.%2", _timeElapsed select 0, (_timeElapsed select 1) select [0, TIME_ROUND_CHARS]];
    _timeElapsed = parseNumber _timeElapsed;

    [_idPFH, _controller, _controllers, _name, _targets, _targetsInvalid, _mode, true, GVAR(currentScore), GVAR(maxScore), _timeElapsed, _triggers] call FUNC(popupPFHexit);
};

// Handle automatic target pop-ups in time-based mode
if (_mode == 1 && {GVAR(lastPauseTime) + _pauseDuration <= _currentTime}) exitWith {
    GVAR(lastPauseTime) = _currentTime;

    if (GVAR(firstRun)) then {
        GVAR(firstRun) = false;
    } else {
        // Animate old target
        [GVAR(targetUp), 1] call FUNC(animateTarget); // Down
    };

    // Select random index (save for later removal from array) and new target
    GVAR(nextTarget) = selectRandom (_targets - [GVAR(targetUp)]);

    // Animate new target
    [GVAR(nextTarget), 0] call FUNC(animateTarget); // Up

    // Mark target as not yet hit
    GVAR(nextTarget) setVariable [QGVAR(hit), false];

    TRACE_2("Targets",GVAR(targetUp),GVAR(nextTarget));

    // Prepare for next loop
    GVAR(targetUp) = GVAR(nextTarget);
    GVAR(maxScore) = GVAR(maxScore) + 1;
};

// Handle duration and first target only when hit-based mode
if (_mode in [2, 3] && {GVAR(firstRun)}) exitWith {
    GVAR(firstRun) = false;

    // Select random index (save for later removal from array) and new target
    GVAR(targetUp) = selectRandom _targets;

    // Animate new target
    GVAR(targetUp) setDamage 0;
    [GVAR(targetUp), 0] call FUNC(animateTarget); // Up
};
