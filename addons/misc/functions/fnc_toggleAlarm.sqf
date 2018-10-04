#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles the Alarm switching.
 *
 * Arguments:
 * 0: Button <OBJECT>
 * 1: Speakers <ARRAY>
 * 2: (Optional) Sound Type from CfgVehicles <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [<arg0>, [<arg1>]] call TAC_Misc_fnc_toggleAlarm;
 * [<arg0>, [<arg1.0>, <arg1.1>, <arg1.2>], "Sound_Alarm"] call TAC_Misc_fnc_toggleAlarm;
 */

params ["_button", "_speakers", ["_soundType", "Sound_Alarm"]];

// Enable Alarm
_button addAction ["<t color='#00FF00'>Enable Alarm</t>", {
    params ["_button", "", "", "_args"];
    _args params ["_speakers", "_soundType"];

    // Create sound source
    private _sources = [];
    {
        private _source = createSoundSource [_soundType, position _x, [], 0];
        _sources pushBack _source;
    } forEach _speakers;

    // Set variable containing the sound source
    _button setVariable ["TAC_Misc_alarmEnabled", _sources, true];

    hint "Alarm Enabled";//debug
}, [_speakers, _soundType], 6, true, true, "", "isNil{_target getVariable 'TAC_Misc_alarmEnabled'}"];

// Disable Alarm
_button addAction ["<t color='#FF0000'>Disable Alarm</t>", {
    params ["_button"];

    // Remove sound source
    private _sources = _button getVariable "TAC_Misc_alarmEnabled";
    {
        deleteVehicle _x;
    } forEach _sources;

    // Set variable back to nil (for addAction condition)
    _button setVariable ["TAC_Misc_alarmEnabled", nil, true];

    hint "Alarm Disabled";//debug
}, nil, 6, true, true, "", "!isNil{_target getVariable 'TAC_Misc_alarmEnabled'}"];
