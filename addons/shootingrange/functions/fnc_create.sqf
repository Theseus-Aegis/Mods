/*
 * Author: Jonpas
 * Creates a shooting range. Local effect, must be called on each client machine.
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
    ["_targetAmounts", [], [[]] ],
    ["_defaultTargetAmount", TARGETAMOUNT_DEFAULT, [0] ],
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

if (_defaultCountdownTime < COUNTDOWNTIME_LOWEST) then {
    ACE_LOGWARNING("Default Countdown Time field/argument is below 5! Value set to default.");
    _defaultCountdownTime = COUNTDOWNTIME_DEFAULT;
};
{
    if (_x < COUNTDOWNTIME_LOWEST) then {
        ACE_LOGWARNING("Countdown Times field/argument contains a value below 5! Removed value.");
        _countdownTimes deleteAt _forEachIndex;
    };
} forEach _countdownTimes;

if (_mode == 4 && {_triggerMarkers isEqualTo [] || {count _triggerMarkers != count _targets}}) exitWith {
    ACE_LOGERROR("Trigger Markers field/argument must NOT be empty and must have same number of elements when Trigger Mode is used!");
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

if (_targetAmounts isEqualTo []) then {
    _targetAmounts = TARGETAMOUNTS_DEFAULT;
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

if !(_defaultTargetAmount in _targetAmounts) then {
    _targetAmounts pushBack _defaultTargetAmount;
};

if !(_defaultPauseDuration in _pauseDurations) then {
    _pauseDurations pushBack _defaultPauseDuration;
};

if !(_defaultCountdownTime in _countdownTimes) then {
    _countdownTimes pushBack _defaultCountdownTime;
};

_durations sort true;
_targetAmounts sort true;
_pauseDurations sort true;
_countdownTimes sort true;


// Set up controllers
{
    // Default client configuration
    _x setVariable [QGVAR(duration), _defaultDuration];
    _x setVariable [QGVAR(targetAmount), _defaultTargetAmount];
    _x setVariable [QGVAR(pauseDuration), _defaultPauseDuration];
    _x setVariable [QGVAR(countdownTime), _defaultCountdownTime];

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

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionConfig] call ACE_Interact_Menu_fnc_addActionToObject;

    private _actionCheckConfig = [
        QGVAR(RangeConfigCheck),
        localize LSTRING(ConfigurationCheck),
        "",
        {(_this select 2) call FUNC(checkConfig)},
        {true},
        {},
        [_x, _name, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACE_Interact_Menu_fnc_addActionToObject;

    private _actionConfigDuration = [
        QGVAR(RangeConfigDuration),
        localize LSTRING(Duration),
        "",
        {true},
        {(((_this select 2) select 4) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] < 3},
        {(_this select 2) call FUNC(addConfigDurations)},
        [_name, _x, _controllers, _durations, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACE_Interact_Menu_fnc_addActionToObject;

    private _actionConfigTargetAmount = [
        QGVAR(RangeConfigTargetAmount),
        localize LSTRING(TargetAmount),
        "",
        {true},
        {(((_this select 2) select 4) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] == 3},
        {(_this select 2) call FUNC(addConfigTargetAmounts)},
        [_name, _x, _controllers, _targetAmounts, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigTargetAmount] call ACE_Interact_Menu_fnc_addActionToObject;

    if (_mode < 4) then {
        private _actionConfigPauseDuration = [
            QGVAR(RangeConfigPauseDuration),
            localize LSTRING(PauseDuration),
            "",
            {true},
            {(((_this select 2) select 4) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] == 1},
            {(_this select 2) call FUNC(addConfigPauseDurations)},
            [_name, _x, _controllers, _pauseDurations, _targets]
        ] call ACE_Interact_Menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACE_Interact_Menu_fnc_addActionToObject;
    };

    private _actionConfigCountdownTime = [
        QGVAR(RangeConfigCountdownTime),
        localize LSTRING(CountdownTime),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigCountdownTimes)},
        [_name, _x, _controllers, _countdownTimes, _targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigCountdownTime] call ACE_Interact_Menu_fnc_addActionToObject;

    private _actionConfigMode = [
        QGVAR(RangeConfigMode),
        localize LSTRING(Mode),
        "",
        {true},
        {(((_this select 2) select 0) select 0) getVariable [QGVAR(mode), MODE_DEFAULT] < 4},
        {},
        [_targets]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigMode] call ACE_Interact_Menu_fnc_addActionToObject;

    if (_mode < 4) then {
        // Add target change event configuration actions
        private _actionConfigModeTime = [
            QGVAR(RangeConfigModeTime),
            localize LSTRING(Timed),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, 1, _targets, _x]
        ] call ACE_Interact_Menu_fnc_createAction;

        private _actionConfigModeHitTimeLimited = [
            QGVAR(RangeConfigModeHit),
            localize LSTRING(HitTimeLimit),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, 2, _targets, _x]
        ] call ACE_Interact_Menu_fnc_createAction;

        private _actionConfigModeHitTargetLimited = [
            QGVAR(RangeConfigModeHit),
            localize LSTRING(HitTargetLimit),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, 3, _targets, _x]
        ] call ACE_Interact_Menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeTime] call ACE_Interact_Menu_fnc_addActionToObject;
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeHitTimeLimited] call ACE_Interact_Menu_fnc_addActionToObject;
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeHitTargetLimited] call ACE_Interact_Menu_fnc_addActionToObject;
    };
} forEach _controllers;


private _triggers = [];
if (_mode == 4) then {
    // Prepare target groups
    [_targets, _triggerMarkers] call FUNC(setTargetGroups);

    // Set up triggers
    {
        private _trigger = createTrigger ["EmptyDetector", getMarkerPos _x, false];

        (getMarkerSize _x) params ["_markerSizeX", "_markerSizeY"];
        _trigger setTriggerArea [_markerSizeX, _markerSizeY, markerDir _x, markerShape _x == "RECTANGLE"];

        _trigger setTriggerActivation ["ANY", "PRESENT", true];

        private _target = _targets select _forEachIndex;
        private _controller = _controllers select 0;
        _trigger setTriggerStatements [
            format ["[%1, %2, %3] call %4", _controller, _target, _forEachIndex, QFUNC(canActivateTrigger)],
            format ["[%1, %2] call %3", _target, 0, QFUNC(triggerPopup)],
            format ["[%1, %2] call %3", _target, 1, QFUNC(triggerPopup)]
        ];

        _trigger enableSimulation false;

        _triggers pushBack _trigger;
    } forEach _triggerMarkers;
};


// Set up targets
{
    _x setVariable [QGVAR(targets), _targets];
    _x setVariable [QGVAR(controllers), _controllers];
    _x setVariable [QGVAR(mode), _mode];
    _x setVariable [QGVAR(triggers), _triggers];
    _x addEventHandler ["HitPart", { (_this select 0) call FUNC(handleHitPart); }];
} forEach _targets;
