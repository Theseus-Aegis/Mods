/*
 * Author: Jonpas
 * Handles the Alarm switching.
 *
 * Arguments:
 * 0: Button <OBJECT>
 * 1: Speakers <OBJECT> or <ARRAY>
 * 2: (Optional) Sound Type from CfgVehicles <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [<arg0>, <arg1>] call TAC_Misc_fnc_toggleAlarm;
 * [<arg0>, [<arg1.0>, <arg1.1>, <arg1.2>]] call TAC_Misc_fnc_toggleAlarm;
 * [<arg0>, <arg1>, <arg2>] call TAC_Misc_fnc_toggleAlarm;
 */
#include "script_component.hpp"

_button = _this select 0;
_speakers = [_this, 1, [_this select 1], [[]]] call BIS_fnc_param;
_soundType = [_this, 2, "Sound_Alarm"] call BIS_fnc_param;


// Enable Alarm
_button addAction ["<t color='#00FF00'>Enable Alarm</t>", {
    _button = _this select 0; // Object addAction is assigned to
    _speakers = (_this select 3) select 0; // Speaker Object (Argument)
    _soundType = (_this select 3) select 1; // Sound Type (Argument)

    // Create sound source
    _sources = [];
    {
        _source = createSoundSource [_soundType, position _x, [], 0];
        _sources pushBack _source;
    } forEach _speakers;

    // Set variable containing the sound source
    _button setVariable ["TAC_Misc_alarmEnabled", _sources, true];

    hint "Alarm Enabled";//debug
}, [_speakers, _soundType], 6, true, true, "", "isNil{_target getVariable 'TAC_Misc_alarmEnabled'}"];


// Disable Alarm
_button addAction ["<t color='#FF0000'>Disable Alarm</t>", {
    _button = _this select 0; // Object addAction is assigned to

    // Remove sound source
    _sources = _button getVariable "TAC_Misc_alarmEnabled";
    {
        deleteVehicle _x;
    } forEach _sources;

    // Set variable back to nil (for addAction condition)
    _button setVariable ["TAC_Misc_alarmEnabled", nil, true];

    hint "Alarm Disabled";//debug
}, nil, 6, true, true, "", "!isNil{_target getVariable 'TAC_Misc_alarmEnabled'}"];
