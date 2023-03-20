#include "script_component.hpp"

// dialogue event.
[QGVAR(dialogue), {
    params ["_speaker", "_message", "_colour", "_time"];
    cutText [
        format [
            "<br/><br/><br/><br/><br/><br/>
            <t color = %3 size = '2'>%1</t>
            <br/>
            <t color = %3 size = '1.5'>%2</t>", _speaker, _message, _textColour],
            "PLAIN", _time, true, true
    ];
}] call CBA_fnc_addEventHandler;
