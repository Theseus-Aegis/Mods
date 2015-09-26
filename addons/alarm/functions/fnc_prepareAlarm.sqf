/*
 * Author: Jonpas
 * Prepares alarm toggle actions.
 *
 * Arguments:
 * 0: Alarm Objects <ARRAY>
 * 1: Button Objects <ARRAY>
 * 2: Sounds Type from CfgVehicles CfgSFX <ARRAY> (default: pre-set list)
 * 3: Sound Names <ARRAY> (default: pre-set list)
 * 4: Duration <NUMBER> (default: 0 - infinite)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[alarm1, alarm2], [button1, button2], ["sound1", "sound2"], ["soundName1", "soundName2"], 60] call tac_alarm_fnc_prepareAlarm
 *
 * Public: Yes
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_currentAlarm", "_alarmsAction", "_stopAlarmsAction", "_button", "_varString"];
params [
    "_alarms",
    "_buttons",
    ["_sounds", DEFAULT_SOUNDS],
    ["_soundNames", DEFAULT_SOUNDNAMES],
    ["_duration", 0]
];

// Verify data
if (_alarms isEqualTo [] || {_buttons isEqualTo []}) exitWith {
    ACE_LOGERROR("Alarms or Buttons fields are empty or have invalid data!");
};
if (typeName _sounds != "ARRAY" || {typeName _soundNames != "ARRAY"}) then {
    _sounds = DEFAULT_SOUNDS;
    _soundNames = DEFAULT_SOUNDNAMES;
};

// If no buttons use objects as buttons
if (count _buttons == 0) then {
    _buttons = _alarms;
};

TRACE_5("Information",_alarms,_buttons,_sounds,_soundNames,_duration);

if (isServer) then {
    // Number of alarms (multiple modules support)
    GVAR(alarms) = GVAR(alarms) + 1;
};

_currentGroup = GVAR(alarms); // Local variable in case GVAR gets changed during execution of below code

// If interaction menu module is not present, set default duration value
if !(["ace_interact_menu"] call ACE_Common_fnc_isModLoaded) then {
    _duration = NOINTERACTMENU_DURATION;
    ACE_LOGINFO_1("Interaction Menu module not present, defaulting duration value to %1",_duration);
};

// Add interactions if automatic stop is disabled, else setup automatic stop
if (_duration == 0) then {
    {
        // Add Alarms sub-action and populate with sounds
        _alarmsAction = [
            QGVAR(Alarms),
            localize LSTRING(Interaction),
            "",
            {},
            {true},
            {(_this select 2) call FUNC(addAlarmActions)},
            [_alarms, _sounds, _soundNames, _x, _currentGroup],
            [0, 0, 0],
            2
        ] call ACE_Interact_Menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions"], _alarmsAction] call ACE_Interact_Menu_fnc_addActionToObject;

        // Add Stop Alarms sub-action
        _stopAlarmsAction = [
            QGVAR(AlarmsStop),
            localize LSTRING(Interaction_Stop),
            "",
            {(_this select 2) call FUNC(stopAlarms)},
            {(_this select 2) call FUNC(canStopAlarms)},
            {},
            [_x],
            [0, 0, 0],
            2
        ] call ACE_Interact_Menu_fnc_createAction;
        [_x, 0, ["ACE_MainActions", QGVAR(Alarms)], _stopAlarmsAction] call ACE_Interact_Menu_fnc_addActionToObject;

        nil
    } count _buttons;
} else {
    if !(isServer) exitWith {};

    diag_log "@todo - automatic stop"

    /*// Formatted GVAR string (multiple modules support)
    _varString = format [QGVAR(alarm%1), _currentGroup];
    TRACE_1("Current Alarm",_varString);

    // Set formatted GVAR to first slide
    missionNamespace setVariable [_varString, 0];

    // Automatic transitions handler
    [FUNC(autoTransition), [_alarms, _sounds, _varString, _duration], _duration] call EFUNC(common,waitAndExecute);*/
};
