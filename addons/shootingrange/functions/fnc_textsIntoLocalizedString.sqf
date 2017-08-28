/*
 * Author: Jonpas
 * Adds shooting range countdown times configuration child interactions to a controller.
 *
 * Arguments:
 * 0: Texts <ARRAY>
 *
 * Return Value:
 * Localized String <STRING>
 *
 * Example:
 * [["text1", "STR_text2"]] call tac_shootingrange_fnc_textsIntoLocalizedStrings;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_texts"];

// Compile texts into one localized string
private _text = "";
{
    private _str = [_x, localize _x] select (_x select [0, 4] == "STR_");
    [_text, _str] joinString "";
} forEach _texts;

_text
