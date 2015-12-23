/*
 * Author: Jonpas
 * Handles target pop-ups.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   1: Start Time <NUMBER>
 *   2: Duration <NUMBER>
 *   3: Targets <ARRAY>
 *   4: Controller <OBJECT>
 *   5: Controllers <ARRAY>
 *   6: Name <STRING>
 * 1: Per-Frame Handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ [450, 60, [target1, target2], controller, [controller1, controller2], "range"], idPFH] call tac_shootingrange_fnc_popupPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_timeStart", "_duration", "_targets", "_controller", "_controllers", "_name"];

// Remove if stopped - fail
if !(_controller getVariable [QGVAR(running), false]) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, false] call FUNC(popupPFHexit);
};

// Remove when time limit (duration) reached - success
if (diag_tickTime >= _timeStart + _duration) exitWith {
    [_idPFH, _controller, _controllers, _name, _targets, true, 5 /*@todo _score*/] call FUNC(popupPFHexit);
};

// Keep original array on first run, delete last target from index in all subsequent runs
private _targetsTemp = +_targets; // Copy array (for deleteAt usage)
if (GVAR(firstRun)) then {
    GVAR(firstRun) = false;
} else {
    _targetsTemp deleteAt GVAR(randomIndex);
    TRACE_2("Target Index Removal",count _targetsTemp,count _targets);

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
