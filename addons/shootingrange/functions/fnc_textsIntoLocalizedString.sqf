/*
 * Author: Jonpas
 * Converts array of strings into one partially localized string (localized where string starts with "STR_").
 *
 * Arguments:
 * 0: Texts <ARRAY>
 *
 * Return Value:
 * Localized String <STRING>
 *
 * Example:
 * [["text", "STR_text"]] call tac_shootingrange_fnc_textsIntoLocalizedString;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_texts"];
TRACE_1("Texts",_texts);

// Compile texts into one localized string
private _text = "";
{
    _x = str _x;
    if (_x select [0, 4] == "STR_") then {
        _x = localize _x;
    };
    _text = [_text, _x] joinString "";
} forEach _texts;

TRACE_1("Localized String",_text);
_text
