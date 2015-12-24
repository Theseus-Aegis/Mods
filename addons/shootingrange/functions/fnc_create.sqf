/*
 * Author: Jonpas
 * Creates a shooting range.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Targets <ARRAY>
 * 2: Controllers <ARRAY>
 * 3: Durations <ARRAY> (default: [0, 30, 60, 150, 300])
 * 4: Default Duration <NUMBER> (default: 60)
 * 5: Pause Durations <ARRAY> (default: [1, 2, 3, 4, 5])
 * 6: Default Pause Duration <NUMBER> (default: 5)
 * 7: Countdown Time <NUMBER> (default: 9)
 * 8: Target Change Event (1 = Time, 2 = Hit, 3 = Trigger) <NUMBER> (default: 1)
 * 9: Triggers <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [target1, target2], [controller1, controller2], [30, 60], 60,  [3, 5], 5, 10, 1] call tac_shootingrange_fnc_create;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_name", [""], [""] ],
    ["_targets", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_durations", [], [[]] ],
    ["_defaultDuration", DURATION_DEFAULT, [0] ],
    ["_pauseDurations", [], [[]] ],
    ["_defaultPauseDuration", PAUSEDURATION_DEFAULT, [0] ],
    ["_countdownTime", COUNTDOWNTIME_DEFAULT, [0] ],
    ["_targetChangeEvent", TARGETCHANGEEVENT_DEFAULT, [0] ],
    ["_triggers", [], [[]] ]
];

// Verify data
if (_targets isEqualTo [] || {_controllers isEqualTo []}) exitWith {
    ACE_LOGERROR("Targets and Controllers fields/arguments must NOT be empty!");
};

if (_countdownTime < COUNTDOWNTIME_LOWEST) then {
    ACE_LOGWARNING("Countdown Time field/argument is below 5! Reverted to default value.");
};

if (_targetChangeEvent == 3 && {_triggers isEqualTo []}) exitWith {
    ACE_LOGERROR("Triggers field/argument must NOT be empty when Trigger is used as Target Change Event!");
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

if !(_defaultDuration in _durations) then {
    _durations pushBack _defaultDuration;
};

if !(_defaultPauseDuration in _pauseDurations) then {
    _pauseDurations pushBack _defaultPauseDuration;
};

_durations sort true;
_pauseDurations sort true;


TRACE_9("Data",_name,_targets,_controllers,_durations,_defaultDuration,_pauseDurations,_defaultPauseDuration,_countdownTime,_targetChangeEvent,_triggers);


// Set up controllers
{
    // Default configuration
    _x setVariable [QGVAR(configDuration), _defaultDuration, true];
    _x setVariable [QGVAR(configPauseDuration), _defaultPauseDuration, true];

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
        [_x, _controllers, _name, _targets, _countdownTime]
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

    private _actionConfigDuration = [
        QGVAR(RangeConfigDuration),
        localize LSTRING(Duration),
        "",
        {true},
        {((_this select 2) select 4) getVariable [QGVAR(targetChangeEvent)] < 3},
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

    private _actionConfigCountdownTime = [
        QGVAR(RangeConfigCountdownTime),
        localize LSTRING(CountdownTime),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigCountdownTimes)},
        [_name, _x, _controllers, _pauseDurations]
    ] call ACE_Interact_Menu_fnc_createAction;

    private _actionConfigTargetChangeEvent = [
        QGVAR(RangeConfigTargetChangeEvent),
        localize LSTRING(TargetChangeEvent),
        "",
        {true},
        {((_this select 2) select 0) getVariable [QGVAR(targetChangeEvent)] < 3},
        {},
        [_targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionConfig] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigCountdownTime] call ACE_Interact_Menu_fnc_addActionToObject;
    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigTargetChangeEvent] call ACE_Interact_Menu_fnc_addActionToObject;


    if (_targetChangeEvent < 3) then {
        // Add target change event configuration actions
        private _actionConfigTargetChangeEventTime = [
            QGVAR(RangeConfigTargetChangeEventTime),
            localize LSTRING(Time),
            "",
            {(_this select 2) call FUNC(setConfigTargetChangeEvent)},
            {true},
            {},
            [_name, 1, _targets]
        ] call ACE_Interact_Menu_fnc_createAction;

        private _actionConfigTargetChangeEventHit = [
            QGVAR(RangeConfigTargetChangeEventHit),
            localize LSTRING(Hit),
            "",
            {(_this select 2) call FUNC(setConfigTargetChangeEvent)},
            {true},
            {},
            [_name, 2, _targets]
        ] call ACE_Interact_Menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigTargetChangeEvent)], _actionConfigTargetChangeEventTime] call ACE_Interact_Menu_fnc_addActionToObject;
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigTargetChangeEvent)], _actionConfigTargetChangeEventHit] call ACE_Interact_Menu_fnc_addActionToObject;
    };
} forEach _controllers;


// Set up targets
{
    _x setVariable [QGVAR(controllers), _controllers, true];
    _x setVariable [QGVAR(targetChangeEvent), _targetChangeEvent, true];
    _x setVariable [QGVAR(targets), _targets, true];
    _x addEventHandler ["HitPart", { (_this select 0) call FUNC(handleHitPart); }];
} forEach _targets;
