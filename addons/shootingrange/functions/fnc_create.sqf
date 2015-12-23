/*
 * Author: Jonpas
 * Creates a shooting range.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Targets <ARRAY>
 * 2: Controllers <ARRAY>
 * 3: Durations <ARRAY>
 * 4: Pause Durations <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[target1, target2], [controller], [5, 10], [1, 2]] call tac_shootingrange_fnc_create;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_name", [""], [""] ],
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
if !(_name isEqualTo "") then {
    _name = [" (", _name, ")"] joinString "";
};

if (_durations isEqualTo []) then {
    _durations = DURATIONS_DEFAULT;
} else {
    _durations pushBack 0; // Add infinite duration
};

if (_pauseDurations isEqualTo []) then {
    _pauseDurations = PAUSEDURATIONS_DEFAULT;
};


TRACE_5("Data",_name,_targets,_controllers,_durations,_pauseDurations);


// Set up controllers
{
    // Add target info and default configuration
    _x setVariable [QGVAR(configDuration), DURATION_DEFAULT, true];
    _x setVariable [QGVAR(configPauseDuration), PAUSEDURATION_DEFAULT, true];

    // Add main shooting course interaction
    private _actionRange = [
        QGVAR(Range),
        format ["%1%2", localize LSTRING(Module), _name],
        "",
        {true},
        {(_this select 2) call FUNC(canStart)},
        {},
        [_x]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionStop = [
        QGVAR(RangeStop),
        format ["%1 %2%3", localize LSTRING(Stop), localize LSTRING(Module), _name],
        "",
        {(_this select 2) call FUNC(stop)},
        {(_this select 2) call FUNC(canStop)},
        {},
        [_x, _controllers, _name, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions"], _actionRange] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions"], _actionStop] call ACE_Interact_Menu_fnc_addActionToObject;


    // Add start/stop actions
    private _actionStart = [
        QGVAR(RangeStart),
        localize LSTRING(Start),
        "",
        {(_this select 2) call FUNC(start)},
        {true},
        {},
        [_name, _targets, _x, _controllers]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionStart] call ACE_Interact_Menu_fnc_addActionToObject;


    // Add configuration actions
    private _actionConfig = [
        QGVAR(RangeConfig),
        localize LSTRING(Configure),
        "",
        {true},
        {true},
        {},
        [_x]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionCheckConfig = [
        QGVAR(RangeConfigCheck),
        localize LSTRING(ConfigurationCheck),
        "",
        {(_this select 2) call FUNC(checkConfig)},
        {true},
        {},
        [_x, _name]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionConfigDuration = [
        QGVAR(RangeConfigDuration),
        localize LSTRING(Duration),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigDurations)},
        [_name, _x, _controllers, _durations]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionConfigPauseDuration = [
        QGVAR(RangeConfigPauseDuration),
        localize LSTRING(PauseDuration),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigPauseDurations)},
        [_name, _x, _controllers, _pauseDurations]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionConfig] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach _controllers;


// attach event handlers for hit counting
// add shooter verification (only the one who started it is able to count towards the score)
