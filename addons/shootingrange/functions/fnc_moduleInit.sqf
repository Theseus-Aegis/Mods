#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Initializes the Shooting Range module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY> (unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract name
private _name = _logic getVariable "Name";

// Extract target objects and add synchronized objects
private _targets = [_logic getVariable "Targets", true, false] call ACEFUNC(common,parseList);
_targets = _targets apply { [missionNamespace getVariable _x, objNull] select (isNil _x) };
_targets append (synchronizedObjects _logic);

// Extract invalid target objects and manually check nil (use object if exists, otherwise objNull)
private _targetsInvalid = [_logic getVariable "TargetsInvalid", true, false] call ACEFUNC(common,parseList);
_targetsInvalid = _targetsInvalid apply { [missionNamespace getVariable _x, objNull] select (isNil _x) };
//TRACE_1("Invalid Targets",_targetsInvalid);

// Exctract controller objects
private _controllers = [_logic getVariable "Controllers", true, true] call ACEFUNC(common,parseList);

// Exctract sound source objects
private _soundSources = [_logic getVariable "SoundSources", true, true] call ACEFUNC(common,parseList);

// Extract target change event
private _mode = _logic getVariable "Mode";

// Extract duration string and convert to numbers
private _durations = ([_logic getVariable "Durations", true, false] call ACEFUNC(common,parseList) apply {parseNumber _x});

// Extract default duration
private _defaultDuration = _logic getVariable "DefaultDuration";

// Extract target amounts string and convert to numbers
private _targetAmounts = ([_logic getVariable "TargetAmounts", true, false] call ACEFUNC(common,parseList) apply {parseNumber _x});

// Extract default target amount
private _defaultTargetAmount = _logic getVariable "DefaultTargetAmount";

// Extract pause duration string and convert to numbers
private _pauseDurations = ([_logic getVariable "PauseDurations", true, false] call ACEFUNC(common,parseList) apply {parseNumber _x});

// Extract default pause duration
private _defaultPauseDuration = _logic getVariable "DefaultPauseDuration";

// Extract countdown times
private _countdownTimes = ([_logic getVariable "CountdownTimes", true, false] call ACEFUNC(common,parseList) apply {parseNumber _x});

// Extract default countdown time
private _defaultCountdownTime = _logic getVariable "DefaultCountdownTime";

// Exctract triggers
private _triggerMarkers = [_logic getVariable "TriggerMarkers", true, false] call ACEFUNC(common,parseList);

// Extract pop targets down on trigger exit setting
private _popOnTriggerExit = _logic getVariable "PopOnTriggerExit";


// Prepare with actions
[_name, _targets, _controllers, _mode, _durations, _defaultDuration, _targetAmounts, _defaultTargetAmount, _pauseDurations, _defaultPauseDuration, _countdownTimes, _defaultCountdownTime, _triggerMarkers, _popOnTriggerExit, _targetsInvalid, _soundSources] call FUNC(create);

INFO_1("Shooting Range Module Initialized (%1)",_name);
