#include "script_component.hpp"
/*
 * Author: Mike
 * On-screen text mimicking speech.
 *
 * Call only on the server, initServer or wrapped in if (isServer) then
 *
 * Arguments:
 * 0: Person Speaking <STRING>
 * 1: Message <STRING>
 * 2: Colour of text <NUMBER> (optional - default: White)
 * 3: On screen time <NUMBER> (optional - default: 2)
 *
 * Colours are:
 * 0: White
 * 1: Black
 * 2: Blue
 * 3: Red
 * 4: Yellow
 * 5: Green
 *
 * Return Value:
 * None
 *
 * Example:
 * ["John James", "I hate all of you.", 0, 3] call MFUNC(dialogue)
 */

params ["_speaker", "_message", ["_colour", 0], ["_time", 2];

if (!isServer) exitWith {};

// Selectable colours.
#define COLOUR_TYPES ["#FFFFFF", "#000000", "#0000ff", "#ff0000", "#ffff00", "#00e600"];
private _textColour = COLOUR_TYPES select _colour;

[QGVAR(dialogue), ["_speaker", "_message", "_textColour", "_time"]] call CBA_fnc_globalEvent;
