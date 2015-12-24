/*
 * Author: Jonpas
 * Creates a shooting range.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Targets <ARRAY>
 * 2: Controllers <ARRAY>
 * 3: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger) <NUMBER> (default: 1)
 * 4: Durations <ARRAY> (default: [0, 30, 60, 150, 300])
 * 5: Default Duration <NUMBER> (default: 60)
 * 6: Pause Durations <ARRAY> (default: [1, 2, 3, 4, 5])
 * 7: Default Pause Duration <NUMBER> (default: 5)
 * 8: Countdown Times <ARRAY> (default: 6, 9, 12, 15)
 * 9: Default Countdown Time <NUMBER> (default: 9)
 * 10: Trigger Markers <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [target1, target2], [controller1, controller2], 1, [30, 60], 60,  [3, 5], 5, 10, [marker1, marker2]] call tac_shootingrange_fnc_create;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_name", [""], [""] ],
    ["_targets", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_mode", MODE_DEFAULT, [0] ],
    ["_durations", [], [[]] ],
    ["_defaultDuration", DURATION_DEFAULT, [0] ],
    ["_pauseDurations", [], [[]] ],
    ["_defaultPauseDuration", PAUSEDURATION_DEFAULT, [0] ],
    ["_countdownTimes", COUNTDOWNTIMES_DEFAULT, [[]] ],
    ["_defaultCountdownTime", COUNTDOWNTIME_DEFAULT, [0] ],
    ["_triggerMarkers", [], [[]] ]
];

// Verify data
if (_targets isEqualTo [] || {_controllers isEqualTo []}) exitWith {
    ACE_LOGERROR("Targets and Controllers fields/arguments must NOT be empty!");
};

if (_mode == 3 && (_triggerMarkers isEqualTo [] || {count _triggerMarkers != count _targets})) exitWith {
    ACE_LOGERROR("Trigger Markers field/argument must NOT be empty and must have same number of elements when Trigger Mode is used!");
};

{
    if (_x < COUNTDOWNTIME_LOWEST) then {
        ACE_LOGWARNING("Countdown Times field/argument contaisn a value below 5! Removed value.");
        _countdownTimes deleteAt _forEachIndex;
    };
} forEach _countdownTimes;


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

if (_countdownTimes isEqualTo []) then {
    _countdownTimes = COUNTDOWNTIMES_DEFAULT;
};

if !(_defaultDuration in _durations) then {
    _durations pushBack _defaultDuration;
};

if !(_defaultPauseDuration in _pauseDurations) then {
    _pauseDurations pushBack _defaultPauseDuration;
};

if !(_defaultCountdownTime in _countdownTimes) then {
    _countdownTimes pushBack _defaultCountdownTime;
};

_durations sort true;
_pauseDurations sort true;
_countdownTimes sort true;


TRACE_9("Data",_name,_targets,_controllers,_mode,_durations,_defaultDuration,_pauseDurations,_defaultPauseDuration,_countdownTime,_triggerMarkers);


// Set up controllers
{
    // Default configuration
    _x setVariable [QGVAR(duration), _defaultDuration, true];
    _x setVariable [QGVAR(pauseDuration), _defaultPauseDuration, true];
    _x setVariable [QGVAR(countdownTime), _defaultCountdownTime, true];

    // Add main shooting course interaction
    private _actionRange = [
        QGVAR(Range),
        format ["%1%2", localize LSTRING(Range), _name],
        "",
        {true},
        {(_this select 2) call FUNC(canStart)},
        {},
        [_x]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionStop = [
        QGVAR(RangeStop),
        format ["%1 %2%3", localize LSTRING(Stop), localize LSTRING(Range), _name],
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
        [_x, _controllers, _name, _targets, _triggerMarkers]
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
        [_x, _name, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionConfig] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACE_Interact_Menu_fnc_addActionToObject;

    if (_mode < 3) then {
        private _actionConfigDuration = [
            QGVAR(RangeConfigDuration),
            localize LSTRING(Duration),
            "",
            {true},
            {(((_this select 2) select 4) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] < 3},
            {(_this select 2) call FUNC(addConfigDurations)},
            [_name, _x, _controllers, _durations, _targets]
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

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACE_Interact_Menu_fnc_addActionToObject;
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACE_Interact_Menu_fnc_addActionToObject;
    };

    private _actionConfigCountdownTime = [
        QGVAR(RangeConfigCountdownTime),
        localize LSTRING(CountdownTime),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigCountdownTimes)},
        [_name, _x, _controllers, _countdownTimes]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionConfigMode = [
        QGVAR(RangeConfigMode),
        localize LSTRING(Mode),
        "",
        {true},
        {(((_this select 2) select 0) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] < 3},
        {},
        [_targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigCountdownTime] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigMode] call ACE_Interact_Menu_fnc_addActionToObject;

    if (_mode < 3) then {
        // Add target change event configuration actions
        private _actionConfigModeTime = [
            QGVAR(RangeConfigModeTime),
            localize LSTRING(Timed),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, 1, _targets]
        ] call ACE_Interact_Menu_fnc_createAction;

        private _actionConfigModeHit = [
            QGVAR(RangeConfigModeHit),
            localize LSTRING(Hit),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, 2, _targets]
        ] call ACE_Interact_Menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeTime] call ACE_Interact_Menu_fnc_addActionToObject;
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeHit] call ACE_Interact_Menu_fnc_addActionToObject;
    };
} forEach _controllers;


// Set up triggers
private _triggers = [];
{
    private _trigger = createTrigger ["EmptyDetector", getMarkerPos _x, false];

    (getMarkerSize _x) params ["_markerSizeX", "_markerSizeY"];
    _trigger setTriggerArea [_markerSizeX, _markerSizeY, markerDir _x, markerShape _x == "RECTANGLE"];

    _trigger setTriggerActivation ["ANY", "PRESENT", true];

    private _target = _targets select _forEachIndex;
    private _controller = _controllers select 0;
    _trigger setTriggerStatements [
        format ["[%1, %2, %3] call %4", _controller, _target, _forEachIndex, QFUNC(canActivateTrigger)],
        format ["[%1, %2] call %3", _target, true, QFUNC(triggerPopup)],
        format ["[%1, %2] call %3", _target, false, QFUNC(triggerPopup)]
    ];

    _trigger enableSimulation false;

    _triggers pushBack _trigger;
} forEach _triggerMarkers;


// Set up targets
{
    _x setVariable [QGVAR(targets), _targets, true];
    _x setVariable [QGVAR(controllers), _controllers, true];
    _x setVariable [QGVAR(mode), _mode, true];
    _x setVariable [QGVAR(triggers), _triggers, true];
    _x addEventHandler ["HitPart", { (_this select 0) call FUNC(handleHitPart); }];
} forEach _targets;
