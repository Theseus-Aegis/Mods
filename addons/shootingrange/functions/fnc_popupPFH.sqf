/*
 * Author: Jonpas
 * Handles target pop-ups.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Time Start <NUMBER>
 *   1: Duration <NUMBER>
 *   2: Targets <ARRAY>
 *   3: Controller <OBJECT>
 *   4: Controllers <ARRAY>
 *   5: Name <STRING>
 *   6: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger) <NUMBER>
 *   7: Triggers <ARRAY>
 * 1: Per-Frame Handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ [450, 60, [target1, target2], controller, [controller1, controller2], "range", 1, [trigger1, trigger2]], idPFH] call tac_shootingrange_fnc_popupPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_timeStart", "_duration", "_targets", "_controller", "_controllers", "_name", "_mode", "_triggers"];
diag_log _args;

// Remove if stopped - fail
if !(_controller getVariable [QGVAR(running), false]) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _mode, false] call FUNC(popupPFHexit);
};

// Remove when time limit (duration) reached or all targets hit - success
if (_mode < 3 && {diag_tickTime >= _timeStart + _duration}) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _mode, true, GVAR(score), GVAR(maxScore)] call FUNC(popupPFHexit);
};

if (_mode > 2 && {GVAR(targetNumber) == count _targets}) exitWith {
    private _timeElapsed = 0;
    if (_mode == 3) then {
        // Round number to decimal places
        _timeElapsed = diag_tickTime - _timeStart;
        _timeElapsed = (str _timeElapsed) splitString ".";
        _timeElapsed = format ["%1.%2", _timeElapsed select 0, (_timeElapsed select 1) select [0, TIME_ROUND_CHARS]];
        _timeElapsed = parseNumber (_timeElapsed);
    };
    [_idPFH, _controller, _controllers, _name, _targets, _mode, true, GVAR(score), GVAR(maxScore), _timeElapsed, _triggers] call FUNC(popupPFHexit);
};

// Exit when trigger-based mode
if (_mode == 3) exitWith {};

// Exit if target change event is not "Time" (only handle duration and first target)
if (_mode == 2) exitWith {
    if (GVAR(firstRun)) then {
        GVAR(firstRun) = false;

        // Select random index (save for later removal from array) and new target
        GVAR(randomIndex) = floor (random (count _targets));
        GVAR(targetUp) = _targets select GVAR(randomIndex);

        // Animate new target
        GVAR(targetUp) animate ["terc", 0]; // Up
    };
};


// Keep original array on first run, delete last target from index in all subsequent runs
private _targetsTemp = +_targets; // Copy array (for deleteAt usage)
if (GVAR(firstRun)) then {
    GVAR(firstRun) = false;
} else {
    _targetsTemp deleteAt GVAR(randomIndex);

    // Animate old target
    GVAR(targetUp) animate ["terc", 1]; // Down
};

// Select random index (save for later removal from array) and new target
GVAR(randomIndex) = floor (random (count _targetsTemp));
GVAR(nextTarget) = _targetsTemp select GVAR(randomIndex);

// Animate new target
GVAR(nextTarget) animate ["terc", 0]; // Up

TRACE_3("Targets",GVAR(randomIndex),GVAR(targetUp),GVAR(nextTarget));

// Prepare for next loop
GVAR(targetUp) = GVAR(nextTarget);
GVAR(maxScore) = GVAR(maxScore) + 1;
