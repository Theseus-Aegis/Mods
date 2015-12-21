/*
 * Author: Jonpas
 * Creates a shooting range.
 *
 * Arguments:
 * 0: Targets <ARRAY>
 * 1: Controllers <ARRAY>
 * 2: Durations <ARRAY>
 * 3: Pause Durations <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[target1, target2], [controller], [5, 10], [1, 2]] call tac_shootingrange_fnc_createRange;
 *
 * Public: Yes
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params [
    ["_targets", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_durations", [], [[]] ],
    ["_pauseDurations", [], [[]] ]
];

// Verify data
if (_targets isEqualTo [] || {_controllers isEqualTo []}) exitWith {
    ACE_LOGERROR("Targets and Controllers fields/arguments must NOT be empty!");
};

// Defaults
if (_durations isEqualTo []) then {
    _durations = DURATIONS_DEFAULT;
} else {
    _durations pushBack 0; // Add infinite duration
};

if (_pauseDurations isEqualTo []) then {
    _pauseDurations = PAUSEDURATIONS_DEFAULT;
};

TRACE_4("Data",_targets,_controllers,_durations,_pauseDurations);

{
    // Add target info
    _x setVariable [QGVAR(targetsConnected), _targets];

    // Add action
    private _rangeStartAction = [
        QGVAR(RangeStart),
        localize LSTRING(StartCourse),
        "",
        {true},
        {(_this select 2) call FUNC(canStartRange)},
        {(_this select 2) call FUNC(addDurationActions)},
        [_x, _controllers, _durations, _pauseDurations],
        [0, 0, 0],
        2
    ] call ACE_Interact_Menu_fnc_createAction;

    private _rangeStopAction = [
        QGVAR(RangeStop),
        localize LSTRING(StopCourse),
        "",
        {(_this select 2) call FUNC(stopRange)},
        {(_this select 2) call FUNC(canStopRange)},
        {},
        [_x, _controllers],
        [0, 0, 0],
        2
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions"], _rangeStartAction] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions"], _rangeStopAction] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach _controllers;


// attach event handlers for hit counting
// add shooter verification (only the one who started it is able to count towards the score)
