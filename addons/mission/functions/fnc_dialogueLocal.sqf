#include "..\script_component.hpp"
/*
 * Author: Mike
 * Local execution of dialogue function
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
