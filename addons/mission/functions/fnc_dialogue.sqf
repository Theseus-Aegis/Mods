#include "..\script_component.hpp"
/*
 * Author: Mike
 * On-screen text mimicking speech.
 *
 * Call only locally on one machine.
 *
 * Arguments:
 * 0: Person Speaking <STRING>
 * 1: Message <STRING>
 * 2: Colour (Hex code) <STRING> (optional - default: #FFFFFF)
 * 3: Fade in Time <NUMBER> (optional - default: 1)
 *
 * Colours are:
 * White - #fffffff
 * Black - #000000
 * Blue - #0000ff
 * Red - #ff0000
 * Yellow - #ffff00
 * Green - #00e600
 *
 * Return Value:
 * None
 *
 * Example:
 * ["John James", "I hate all of you.", "#ffffff", 2] call MFUNC(dialogue)
 */

params ["_speaker", "_message", ["_colour", "#ffffff"], ["_time", 1]];

[QGVAR(dialogue), [_speaker, _message, _colour, _time]] call CBA_fnc_globalEvent;
