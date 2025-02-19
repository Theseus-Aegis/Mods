#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up signal jamming based on active jammers.
 * Call from init.sqf
 *
 * Modify cases below depending on your amount of jammers and wanted effects.
 * Jamming effect will be applied on top of ACRE's signal calculation, taking terrain, distance etc. into account.
 * Refer to https://acre2.idi-systems.com/wiki/frameworks/custom-signal-processing for details.
 *
 * Arguments:
 * 0: Jammer objects <ARRAY>
 * 1: Signal degradation parameters <ARRAY> (default: [[0.0, ...], [0, ...]])
 *   0: Strength reduction (0.0 to 1.0, higher reduction degrades signal) <NUMBER>
 *   1: Decibel reduction (0 to 110 reduction is typically heard, higher reduction is not) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [[jammer1, jammer2]] call MFUNC(jam)
 * [[jammer1, jammer2], [[0.1, 0.5], [20, 60]]] call MFUNC(jam)
 */

if !(["acre_main"] call ACEFUNC(common,isModLoaded)) exitWith {
    ERROR_MSG_1("ACRE2 is required for %1!",QFUNC(jam));
};

params [["_jammers", [], [[]]], ["_degradation", [], [[]]]];

if (count _jammers != count _degradation) exitWith {
    ERROR_MSG_1("Invalid signal jamming parameters! Expected 0 or %1 degradation parameters for %1 jammers",count _jammers);
};

// Make global for EH and signal function use
GVAR(activeJammers) = _jammers;
GVAR(jamParameters) = _degradation;

// Remove jammer objects on destruction
private _jammerClasses = _jammers apply {typeOf _x};
_jammerClasses = _jammerClasses arrayIntersect _jammerClasses; // remove duplicates
{
    [_x, "Killed", { // executed locally
        params ["_object"];
        GVAR(activeJammers) = GVAR(activeJammers) - [_object];
        publicVariable QGVAR(activeJammers);
    }] call CBA_fnc_addClassEventHandler;
} forEach _jammerClasses;

// Register custom signal function
[{
    // ACRE signal processing
    private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
    _coreSignal params ["_Px", "_maxSignal"];

    // Modify if any active jammers
    private _activeJammers = count GVAR(activeJammers);
    if (_activeJammers > 0) then {
        (GVAR(jamParameters) select (_activeJammers - 1)) params ["_strengthReduction", "_decibelReduction"];

        _maxSignal = _maxSignal - _strengthReduction;
        _Px = _Px - _decibelReduction;
    };

    // return final values
    [_Px, _maxSignal]
}] call acre_api_fnc_setCustomSignalFunc;
