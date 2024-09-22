#include "..\script_component.hpp"
/*
 * Author: Mike
 * Local execution of dialogue function, creates a diary entry with the speaker and message.
 */
params ["_speaker", "_message", "_colour", "_time"];
cutText [
    format [
        "<br/><br/><br/><br/><br/><br/>
        <t color = '%3' size = '2'>%1</t>
        <br/>
        <t color = '%3' size = '1.5'>%2</t>",
        _speaker, _message, _colour
    ],
    "PLAIN", _time, true, true
];

// Log the dialogue to a diary record, title is just the exact time it happened HH:MM:SS
private _diaryEntry = format ["%1:<br/>%2", _speaker, _message];
private _diaryTitle = [dayTime] call BIS_fnc_timeToString;
ace_player createDiaryRecord ["Communications Log", [_diaryTitle, _diaryEntry]];
