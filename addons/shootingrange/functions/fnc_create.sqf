#include "script_component.hpp"
/*
 * Author: Jonpas
 * Creates a shooting range. Local effect, must be called on each client machine.
 *
 * Arguments:
 * 0: Name <STRING> (default: "")
 * 1: Targets <ARRAY>
 * 2: Controllers <ARRAY>
 * 3: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger, 5 = Rampage) <NUMBER> (default: 1)
 * 4: Durations <ARRAY> (default: [0, 30, 60, 150, 300])
 * 5: Default Duration <NUMBER> (default: 60)
 * 6: Pause Durations <ARRAY> (default: [1, 2, 3, 4, 5])
 * 7: Default Pause Duration <NUMBER> (default: 5)
 * 8: Countdown Times <ARRAY> (default: 6, 9, 12, 15)
 * 9: Default Countdown Time <NUMBER> (default: 9)
 * 10: Trigger Markers <ARRAY> (default: [])
 * 11: Pop on Trigger Exit <BOOL> (default: true)
 * 12: Invalid Targets <ARRAY> (default: [])
 * 13: Sound Sources <ARRAY> (default: [])
 * 14: Deprecated - used to be: Hits <ARRAY> (default: [1])
 * 15: Deprecated - used to be: Show Hits <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 *     "range", [target1, target2], [controller1, controller2], 1, [30, 60], 60, [3, 5], 5, 10, [5, 9],
 *     [trigger1, trigger2], true, [invalidTarget1, invalidTarget2], [source1, source2]
 * ] call tac_shootingrange_fnc_create;
 *
 * Public: Yes
 */

params [
    ["_name", "", [""] ],
    ["_targets", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_mode", MODE_DEFAULT, [0] ],
    ["_durations", DURATIONS_DEFAULT, [[]] ],
    ["_defaultDuration", DURATION_DEFAULT, [0] ],
    ["_targetAmounts", TARGETAMOUNTS_DEFAULT, [[]] ],
    ["_defaultTargetAmount", TARGETAMOUNT_DEFAULT, [0] ],
    ["_pauseDurations", PAUSEDURATIONS_DEFAULT, [[]] ],
    ["_defaultPauseDuration", PAUSEDURATION_DEFAULT, [0] ],
    ["_countdownTimes", COUNTDOWNTIMES_DEFAULT, [[]] ],
    ["_defaultCountdownTime", COUNTDOWNTIME_DEFAULT, [0] ],
    ["_triggerMarkers", [], [[]] ],
    ["_popOnTriggerExit", POPONTRIGGEREXIT_DEFAULT, [true] ],
    ["_targetsInvalid", [], [[]] ],
    ["_soundSources", [], [[]] ],
    "", // deprecated - backwards compatibility
    "" // deprecated - backwards compatibility
];

// Verify data
if (_targets isEqualTo [] || {_controllers isEqualTo []}) exitWith {
    ERROR_1("Targets and Controllers fields/arguments must NOT be empty! (%1)",_name);
};

if (_mode == 4 && {count _triggerMarkers != count _targets}) exitWith {
    ERROR_1("Trigger Markers field/argument must have the same number of elements as Targets field/argument when Trigger Mode is used! (%1)",_name);
};
if (_mode == 4 && {count _triggerMarkers < count _targetsInvalid}) exitWith {
    ERROR_1("Invalid Targets field/argument must have equal or less elements than Trigger Markers and Targets fields/arguments when Trigger Mode is used! (%1)",_name);
};

if (_defaultCountdownTime < COUNTDOWNTIME_LOWEST) then {
    WARNING_1("Default Countdown Time field/argument is below 5! Value set to default. (%1)",_name);
    _defaultCountdownTime = COUNTDOWNTIME_DEFAULT;
};
{
    if (_x < COUNTDOWNTIME_LOWEST) then {
        WARNING_1("Countdown Times field/argument contains a value below 5! Removed value. (%1)",_name);
        _countdownTimes deleteAt _forEachIndex;
    };
} forEach _countdownTimes;

// Filter Trigger Markers manually as they can be markers or triggers
private _triggerMarkersFiltered = _triggerMarkers apply {
    if (getMarkerColor _x == "") then {
        [missionNamespace getVariable _x, objNull] select (isNil _x);
    } else {
        _x
    };
};
if (count _triggerMarkers != count _triggerMarkersFiltered) then {
    ERROR_1("Invalid triggers in Trigger Markers! Make sure all triggers are correctly set! (%1)", _name);
};
_triggerMarkers = _triggerMarkersFiltered;

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


// Filter null targets to have correct target count, keep them for target grouping (Trigger mode)
private _targetsAll = _targets;
_targets = _targets select { !isNull _x };
TRACE_2("Targets All",_targetsAll,_targets);


// Set up default configuration and interactions
{
    _x setVariable [QGVAR(targets), _targets];
    _x setVariable [QGVAR(targetsInvalid), _targetsInvalid];
    if (_x getVariable [QGVAR(duration), 0] == 0) then {
        _x setVariable [QGVAR(duration), _defaultDuration, true];
    };
    if (_x getVariable [QGVAR(targetAmount), 0] == 0) then {
        _x setVariable [QGVAR(targetAmount), _defaultTargetAmount, true];
    };
    if (_x getVariable [QGVAR(pauseDuration), 0] == 0) then {
        _x setVariable [QGVAR(pauseDuration), _defaultPauseDuration, true];
    };
    if (_x getVariable [QGVAR(countdownTime), 0] == 0) then {
        _x setVariable [QGVAR(countdownTime), _defaultCountdownTime, true];
    };
    if (_x getVariable [QGVAR(mode), 0] == 0) then {
        _x setVariable [QGVAR(mode), _mode, true];
    };
    _x setVariable [QGVAR(soundSources), _controllers + _soundSources];

    // Main
    private _actionRange = [
        QGVAR(Range),
        format ["%1%2", localize LSTRING(Range), _name],
        "",
        {true},
        {!((_this select 2) getVariable [QGVAR(running), false])},
        {},
        _x
    ] call ACEFUNC(interact_menu,createAction);

    // Stop
    private _actionStop = [
        QGVAR(RangeStop),
        format ["%1 %2%3", localize LSTRING(Stop), localize LSTRING(Range), _name],
        "",
        {(_this select 2) call FUNC(stop)},
        {((_this select 2) select 0) getVariable [QGVAR(running), false]},
        {},
        [_x, _controllers, _name, _targets]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions"], _actionRange] call ACEFUNC(interact_menu,addActionToObject);
    [_x, 0, ["ACE_MainActions"], _actionStop] call ACEFUNC(interact_menu,addActionToObject);


    // Start
    private _actionStart = [
        QGVAR(RangeStart),
        localize LSTRING(Start),
        "",
        {(_this select 2) call FUNC(start)},
        {true},
        {},
        [_x, _controllers, _name, _targets, _targetsInvalid]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionStart] call ACEFUNC(interact_menu,addActionToObject);


    // Configuration
    private _actionConfig = [
        QGVAR(RangeConfig),
        localize LSTRING(Configure),
        "",
        {true},
        {true},
        {},
        [_x]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range)], _actionConfig] call ACEFUNC(interact_menu,addActionToObject);

    private _actionCheckConfig = [
        QGVAR(RangeConfigCheck),
        localize LSTRING(Check),
        "",
        {(_this select 2) call FUNC(checkConfig)},
        {true},
        {},
        [_x, _name, _targets]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACEFUNC(interact_menu,addActionToObject);

    private _actionConfigDuration = [
        QGVAR(RangeConfigDuration),
        localize LSTRING(Duration),
        "",
        {true},
        {((_this select 2) select 1) getVariable [QGVAR(mode), MODE_DEFAULT] in [1, 2, 5]},
        {(_this select 2) call FUNC(addConfigDurations)},
        [_name, _x, _controllers, _durations, _targets]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACEFUNC(interact_menu,addActionToObject);

    private _actionConfigTargetAmount = [
        QGVAR(RangeConfigTargetAmount),
        localize LSTRING(TargetAmount),
        "",
        {true},
        {((_this select 2) select 1) getVariable [QGVAR(mode), MODE_DEFAULT] == 3},
        {(_this select 2) call FUNC(addConfigTargetAmounts)},
        [_name, _x, _controllers, _targetAmounts, _targets]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigTargetAmount] call ACEFUNC(interact_menu,addActionToObject);

    if (_mode != 4) then {
        private _actionConfigPauseDuration = [
            QGVAR(RangeConfigPauseDuration),
            localize LSTRING(PauseDuration),
            "",
            {true},
            {((_this select 2) select 1) getVariable [QGVAR(mode), MODE_DEFAULT] == 1},
            {(_this select 2) call FUNC(addConfigPauseDurations)},
            [_name, _x, _controllers, _pauseDurations, _targets]
        ] call ACEFUNC(interact_menu,createAction);

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACEFUNC(interact_menu,addActionToObject);
    };

    private _actionConfigCountdownTime = [
        QGVAR(RangeConfigCountdownTime),
        localize LSTRING(CountdownTime),
        "",
        {true},
        {true},
        {(_this select 2) call FUNC(addConfigCountdownTimes)},
        [_name, _x, _controllers, _countdownTimes, _targets]
    ] call ACEFUNC(interact_menu,createAction);

    [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigCountdownTime] call ACEFUNC(interact_menu,addActionToObject);

    if (_mode != 4) then {
        private _actionConfigMode = [
            QGVAR(RangeConfigMode),
            localize LSTRING(Mode),
            "",
            {true},
            {true},
            {},
            []
        ] call ACEFUNC(interact_menu,createAction);

        private _actionConfigModeTime = [
            QGVAR(RangeConfigModeTime),
            localize LSTRING(Timed),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, _x, _controllers, 1, _targets]
        ] call ACEFUNC(interact_menu,createAction);

        private _actionConfigModeHitTimeLimited = [
            QGVAR(RangeConfigModeHitTimeLimited),
            localize LSTRING(HitTimeLimit),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, _x, _controllers, 2, _targets]
        ] call ACEFUNC(interact_menu,createAction);

        private _actionConfigModeHitTargetLimited = [
            QGVAR(RangeConfigModeHitTargetLimited),
            localize LSTRING(HitTargetLimit),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, _x, _controllers, 3, _targets]
        ] call ACEFUNC(interact_menu,createAction);

        private _actionConfigModeRampage = [
            QGVAR(RangeConfigModeRampage),
            localize LSTRING(Rampage),
            "",
            {(_this select 2) call FUNC(setConfigMode)},
            {true},
            {},
            [_name, _x, _controllers, 5, _targets]
        ] call ACEFUNC(interact_menu,createAction);

        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigMode] call ACEFUNC(interact_menu,addActionToObject);
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeTime] call ACEFUNC(interact_menu,addActionToObject);
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeHitTimeLimited] call ACEFUNC(interact_menu,addActionToObject);
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeHitTargetLimited] call ACEFUNC(interact_menu,addActionToObject);
        [_x, 0, ["ACE_MainActions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigMode)], _actionConfigModeRampage] call ACEFUNC(interact_menu,addActionToObject);
    };
} forEach _controllers;


private _triggers = [];
private _triggerMarkersSet = [];
if (_mode == 4) then {
    // Prepare target groups
    [_targetsAll, _targetsInvalid, _triggerMarkers] call FUNC(setTargetGroups);

    // Set up triggers
    {
        if !(_x in _triggerMarkersSet) then {
            private _trigger = _x;

            if (_x isEqualType "") then {
                // Marker was passed, we create trigger manually
                _trigger = createTrigger ["EmptyDetector", getMarkerPos _x, false];

                (getMarkerSize _x) params ["_markerSizeX", "_markerSizeY"];
                _trigger setTriggerArea [_markerSizeX, _markerSizeY, markerDir _x, markerShape _x == "RECTANGLE"];
            } else {
                // Fail-safes for pre-defined triggers
                _trigger setTriggerType "NONE";
            };

            _trigger setTriggerActivation ["ANY", "PRESENT", true];

            private _target = _targetsAll select _forEachIndex;
            private _controller = _controllers select 0;
            _trigger setTriggerStatements [
                format ["[%1, %2] call %3", _controller, _target, QFUNC(canActivateTrigger)],
                format ["[%1, %2] call %3", _target, 0, QFUNC(triggerPopup)],
                format ["if (%1) then { [%2, %3] call %4 }", _popOnTriggerExit, _target, 1, QFUNC(triggerPopup)]
            ];

            _trigger enableSimulation false;

            _triggers pushBack _trigger;
            _triggerMarkersSet pushBack _x;
        };
    } forEach _triggerMarkers;
};


// Set up targets
{
    _x setVariable [QGVAR(targets), _targets];
    _x setVariable [QGVAR(targetsInvalid), _targetsInvalid];
    _x setVariable [QGVAR(controllers), _controllers];
    _x setVariable [QGVAR(triggers), _triggers];
} forEach (_targets + _targetsInvalid);
