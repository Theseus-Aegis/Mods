/*
 * Author: Jonpas
 * Handles target pop-ups.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Time Start <NUMBER>
 *   1: Duration <NUMBER>
 *   2: Target Amount <NUMBER>
 *   3: Targets <ARRAY>
 *   4: Controller <OBJECT>
 *   5: Controllers <ARRAY>
 *   6: Name <STRING>
 *   7: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger) <NUMBER>
 *   8: Triggers <ARRAY>
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
_args params ["_timeStart", "_duration", "_targetAmount", "_targets", "_controller", "_controllers", "_name", "_mode", "_triggers"];

// Remove if stopped - fail
if !(_controller getVariable [QGVAR(running), false]) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _mode, false] call FUNC(popupPFHexit);
};

// Remove when time limit (duration) reached - success
if (_mode in [1, 2] && {diag_tickTime >= _timeStart + _duration}) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, _mode, true, GVAR(targetNumber), GVAR(maxScore)] call FUNC(popupPFHexit);
};

// Remove when all targets hit - success
if ((_mode == 3 && {GVAR(targetNumber) >= _targetAmount}) || {_mode == 4 && {GVAR(targetNumber) >= count _targets}}) exitWith {
    diag_log "exit PFH";
    // Round time elapsed to decimal places
    private _timeElapsed = diag_tickTime - _timeStart;
    _timeElapsed = (str _timeElapsed) splitString ".";
    _timeElapsed = format ["%1.%2", _timeElapsed select 0, (_timeElapsed select 1) select [0, TIME_ROUND_CHARS]];
    _timeElapsed = parseNumber (_timeElapsed);

    [_idPFH, _controller, _controllers, _name, _targets, _mode, true, GVAR(targetNumber), GVAR(maxScore), _timeElapsed, _triggers] call FUNC(popupPFHexit);
};

// Handle automatic target pop-ups in time-based mode
if (_mode == 1) exitWith {
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
};

// Handle duration and first target only when hit-based mode
if (_mode in [2, 3]) exitWith {
    if (GVAR(firstRun)) then {
        GVAR(firstRun) = false;

        // Select random index (save for later removal from array) and new target
        GVAR(randomIndex) = floor (random (count _targets));
        GVAR(targetUp) = _targets select GVAR(randomIndex);

        // Animate new target
        GVAR(targetUp) animate ["terc", 0]; // Up
    };
};
