#include "..\script_component.hpp"
/*
 * Author: Mike
 * Switches ACRE spoken language on unconsciousness
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call MFUNC(unconscious)
 */

params ["_player"];

if (!hasInterface) exitWith {};

// Set languages
["en", "English"] call acre_api_fnc_babelAddLanguageType;
["un", "Unconscious"] call acre_api_fnc_babelAddLanguageType;

// Set spoken
["en"] call acre_api_fnc_babelSetSpokenLanguages;

// Switch language on unconscious toggle
["ace_unconscious", {
    params ["_unit", "_state"];

    if (_unit != ACE_player) exitWith {}; // Ignore if remote unit

    if (_state) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}] call CBA_fnc_addEventHandler;

// Handle unit change (including death)
["unit", {
    params ["_newUnit", "_oldUnit"];

    if (call CBA_fnc_getActiveFeatureCamera != "") exitWith {}; // Ignore if feature camera active (eg. Zeus)

    if (_newUnit getVariable ["ACE_isUnconscious", false]) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}, false] call CBA_fnc_addPlayerEventHandler;

// Handle feature camera (eg. Zeus)
["featureCamera", {
    params ["_unit", "_newCamera"];

    if (_newCamera == "" && {ACE_player getVariable ["ACE_isUnconscious", false]}) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}, false] call CBA_fnc_addPlayerEventHandler;
