#include "..\script_component.hpp"
/*
 * Author: Mike
 * Ambient car alarm playing on vehicle hit, handled locally per player.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Car <OBJECT>
 * 1: Remove Event After Use <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [My_Car, false] call FUNC(ambientCarAlarm);
*/

params ["_vehicle", ["_removeAfterFiring", true]];

// Only add to Cars that would have alarms, extra check for wheeled APCs that inherit from Car_F
if (!_vehicle isKindOf "Car_F") exitWith {
    ERROR_MSG("Vehicle is not a car.");
};
if (_vehicle isKindOf "Wheeled_APC_F") exitWith {};

// Needs empty vehicle
if (crew _vehicle isNotEqualTo []) exitWith {
    ERROR_MSG_1("Vehicle (%1) must be empty.",_vehicle);
};

// Don't add event if JIP and it's already been removed.
if (_vehicle getVariable [QGVAR(alarmEHRemoved), false]) exitWith {};

_vehicle setVariable [QGVAR(removeAlarmEH), _removeAfterFiring];
_vehicle setVariable [QGVAR(alarmEHRemoved), false];

_vehicle addEventHandler ["Hit", {
    params ["_vehicle"];

    // required for multiple EH firings or already playing.
    if (GVAR(carAlarmPlaying)) exitWith {};

    // Remove EH on all other players when event fires
    if (_vehicle getVariable [QGVAR(alarmEHRemoved), false]) exitWith {
        _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
    };

    // Block multiple alarm playings
    GVAR(carAlarmPlaying) = true;
    publicVariable QGVAR(carAlarmPlaying);

    // Remove event, set variable globally to remove it when firing elsewhere.
    if (_vehicle getVariable [QGVAR(removeAlarmEH), false]) then {
        _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
        _vehicle setVariable [QGVAR(alarmEHRemoved), true, true]; // global for all clients.
    };

    // Play Sound
    [QGVAR(say3D), [_vehicle, "Orange_Car_Alarm"]] call CBA_fnc_globalEvent;

    // Delay by 7s before sound can be played again (even on other vehicles)
    [{
        GVAR(carAlarmPlaying) = false;
        publicVariable QGVAR(carAlarmPlaying);
    }, [], 7] call CBA_fnc_waitAndExecute;
}];
