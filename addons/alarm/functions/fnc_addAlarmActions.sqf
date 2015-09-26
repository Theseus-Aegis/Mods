/*
 * Author: Jonpas
 * Adds alarm sound actions.
 *
 * Arguments:
 * 0: Alarms <ARRAY>
 * 1: Sounds <ARRAY>
 * 2: Button <OBJECT>
 * 3: Current Alarm <NUMBER>
 *
 * Return Value:
 * List of actions <ARRAY>
 *
 * Example:
 * [[alarm1, alarm2], [["sound1", "sound2"], ["soundName1", "soundName2"]], button, 1] call tac_alarm_fnc_addAlarmActions
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actions", "_source", "_sources"];
params ["_alarms", "_sounds", "_soundNames", "_button", "_currentGroup"];

_actions = [];
{
    _actions pushBack
    [
        [
            format [QGVAR(alarm%1_sound%2), _currentGroup, _forEachIndex + 1],
            _soundNames select _forEachIndex,
            "",
            {
                //@todo - separate function
                (_this select 2) params ["_alarms", "_sound", "_button"];
                // Get already existing sources (to prevent overwriting and then not able to stop)
                _sources = _button getVariable [QGVAR(sources), []];
                {
                    // Create source and save it
                    _source = createSoundSource [_sound, position _x, [], 0];
                    _sources pushBack _source;
                    nil
                } count _alarms;
                // Save sources back to button
                _button setVariable [QGVAR(sources), _sources, true];
            },
            {true},
            {},
            [_alarms, _sounds select _forEachIndex, _button]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _button
    ];
} forEach _sounds;

TRACE_1("Children actions",_actions);

_actions
