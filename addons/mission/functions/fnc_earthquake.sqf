#include "..\script_component.hpp"
/*
 * Author: Zozo (BI), Mike
 * Rewrite of BIS_fnc_earthquake to run unscheduled and remove excess fatigue code.
 * Uses magnitude between 1-5.
 * Runs local to each player
 *
 * Called globally from Trigger or init.sqf
 *
 * Arguments:
 * 0: Magnitude <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call MFUNC(earthquake);
 */

params [
    ["_magnitude", 1],
    ["_power", 0.3],
    ["_duration", 20],
    ["_frequency", 100],
    ["_offset", 1],
    ["_compensation", 0],
    ["_eqSound", "Earthquake_01"]
];

if (!is3DENPreview && {isServer}) exitWith {};

if (GVAR(earthquakeInProgress)) exitWith {
    ERROR_MSG("Only one instance of Earthquake is supported at a time!");
};

switch (_magnitude) do {
    case 1: {
        _power = 0.5;
        _duration = 13;
        _compensation = 4;
        _frequency = 200;
    };
    case 2: {
        _power = 0.8;
        _compensation = 8.5;
        _frequency = 50;
        _eqSound = "Earthquake_02";
    };
    case 3: {
        _power = 1.5;
        _compensation = 7;
        _frequency = 40;
        _eqSound = "Earthquake_03";
    };
    case 4: {
        _power = 2.1;
        _compensation = 6;
        _frequency = 30;
        _eqSound = "Earthquake_04";
    };
    case 5: {
        _power = 2.5;
        _compensation = 8;
        _frequency = 25;
        _eqSound = "Earthquake_04";
    };
    default {
        WARNING_1("Magnitude (%1) not between 1-5, using default values!",_magnitude);
    };
};

enableCamShake true;
GVAR(earthquakeInProgress) = true;
playSound _eqSound;

"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust [_power/2];
"DynamicBlur" ppEffectCommit _offset;

[{
    params ["_power", "_duration", "_compensation", "_frequency"];

    "DynamicBlur" ppEffectAdjust [0];
    "DynamicBlur" ppEffectCommit (_duration - _compensation);
    addCamShake [_power, _duration, _frequency];
    GVAR(earthquakeInProgress) = false;
}, [_power, _duration, _compensation, _frequency], _offset] call CBA_fnc_waitAndExecute;
