/*
 * Author: Jonpas
 * Initializes the Shooting Range module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract name
private _name = _logic getVariable "Name";

// Extract target objects and add synchronized objects
private _targets = [_logic getVariable "Targets", true, true] call ACE_Common_fnc_parseList;
_targets append (synchronizedObjects _logic);

// Extract invalid target objects and manually check nil (use object if exists, otherwise objNull)
private _targetsInvalid = [_logic getVariable "TargetsInvalid", true, false] call ACE_Common_fnc_parseList;
_targetsInvalid = _targetsInvalid apply { [missionNamespace getVariable _x, objNull] select (isNil _x) };
//TRACE_1("Invalid Targets",_targetsInvalid);

// Exctract controller objects
private _controllers = [_logic getVariable "Controllers", true, true] call ACE_Common_fnc_parseList;

// Extract target change event
private _mode = _logic getVariable "Mode";

// Extract duration string and convert to numbers
private _durationsString = [_logic getVariable "Durations", true, false] call ACE_Common_fnc_parseList;
private _durations = [];
{
    _durations pushBack (parseNumber _x);
} forEach _durationsString;

// Extract default duration
private _defaultDuration = _logic getVariable "DefaultDuration";

// Extract target amounts string and convert to numbers
private _targetAmountsString = [_logic getVariable "TargetAmounts", true, false] call ACE_Common_fnc_parseList;
private _targetAmounts = [];
{
    _targetAmounts pushBack (parseNumber _x);
} forEach _targetAmountsString;

// Extract default target amount
private _defaultTargetAmount = _logic getVariable "DefaultTargetAmount";

// Extract pause duration string and convert to numbers
private _pauseDurationsString = [_logic getVariable "PauseDurations", true, false] call ACE_Common_fnc_parseList;
private _pauseDurations = [];
{
    _pauseDurations pushBack (parseNumber _x);
} forEach _pauseDurationsString;

// Extract default pause duration
private _defaultPauseDuration = _logic getVariable "DefaultPauseDuration";

// Extract countdown times
private _countdownTimesString = [_logic getVariable "CountdownTimes", true, false] call ACE_Common_fnc_parseList;
private _countdownTimes = [];
{
    _countdownTimes pushBack (parseNumber _x);
} forEach _countdownTimesString;

// Extract default countdown time
private _defaultCountdownTime = _logic getVariable "DefaultCountdownTime";

// Exctract triggers
private _triggerMarkers = [_logic getVariable "TriggerMarkers", true, false] call ACE_Common_fnc_parseList;

// Extract pop targets down on trigger exit setting
private _popOnTriggerExit = _logic getVariable "PopOnTriggerExit";


// Prepare with actions
[_name, _targets, _controllers, _mode, _durations, _defaultDuration, _targetAmounts, _defaultTargetAmount, _pauseDurations, _defaultPauseDuration, _countdownTimes, _defaultCountdownTime, _triggerMarkers, _popOnTriggerExit, _targetsInvalid] call FUNC(create);

ACE_LOGINFO("Shooting Range Module Initialized");
