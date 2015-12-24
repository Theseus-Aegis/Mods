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

// Exctract controller objects
private _controllers = [_logic getVariable "Controllers", true, true] call ACE_Common_fnc_parseList;

// Extract duration string and convert to numbers
private _durationsString = [_logic getVariable "Durations", true, false] call ACE_Common_fnc_parseList;
private _durations = [];
{
    _durations pushBack (parseNumber _x);
} forEach _durationsString;

// Extract default duration
private _defaultDuration = _logic getVariable "DefaultDuration";

// Extract default duration
private _defaultPauseDuration = _logic getVariable "DefaultPauseDuration";

// Extract pause duration string and convert to numbers
private _pauseDurationsString = [_logic getVariable "PauseDurations", true, false] call ACE_Common_fnc_parseList;
private _pauseDurations = [];
{
    _pauseDurations pushBack (parseNumber _x);
} forEach _pauseDurationsString;

// Extract countdown time
private _countdownTime = _logic getVariable "CountdownTime";

// Extract target change event
private _targetChangeEvent = _logic getVariable "TargetChangeEvent";

// Exctract triggers
private _triggers = [_logic getVariable "Triggers", true, true] call ACE_Common_fnc_parseList;


// Prepare with actions
[_name, _targets, _controllers, _durations, _defaultDuration, _pauseDurations, _defaultPauseDuration, _countdownTime, _targetChangeEvent, _triggers] call FUNC(create);

ACE_LOGINFO("Shooting Range Module Initialized");
