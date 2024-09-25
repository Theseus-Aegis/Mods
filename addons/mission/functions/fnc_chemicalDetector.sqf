#include "..\script_component.hpp"
/*
 * Author: Mike
 * Adds the chemical detector capability of detecting when inside a dangerous zone.
 * Sounds played are done via playSoundUI so they can be altered via slider in game options.
 * Requires ChemicalDetector_01_watch_F from contact platform update.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Markers <ARRAY>
 * 1: Enable Geiger Sounds <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["MyMarker"], true] call MFUNC(chemicalDetector)
 */

params ["_markers", ["_enableGeigerSounds", false]];

if (_enableGeigerSounds) then {
    GVAR(geigerSounds) = [
        ["tacr_sfx_geigerHigh_1", "tacr_sfx_geigerHigh_2", "tacr_sfx_geigerHigh_3", "tacr_sfx_geigerHigh_4"],
        ["tacr_sfx_geigerNormal_1", "tacr_sfx_geigerNormal_2", "tacr_sfx_geigerNormal_3", "tacr_sfx_geigerNormal_4"],
        ["tacr_sfx_geigerLow_1", "tacr_sfx_geigerLow_2", "tacr_sfx_geigerLow_3", "tacr_sfx_geigerLow_4"]
    ];
};

[{
    params ["_args", "_handle"];
    _args params ["_markers", "_enableGeigerSounds", ["_maximumThreat", 9.99]];

    QGVAR(chemDetector) cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
    private _ui = uiNamespace getVariable ["RscWeaponChemicalDetector", displayNull];
    private _detector = _ui displayCtrl 101;

    if ("ChemicalDetector_01_watch_F" in (assignedItems player)) then {

        private _inAreaCheck = _markers findIf {ace_player inArea _x};
        if (_inAreaCheck != -1) then {
            // Distance is capped to prevent divide by zero.
            private _distance = ace_player distance2d (getMarkerPos (_markers select _inAreaCheck));
            _distance = _distance max 0.001;

            if (_enableGeigerSounds) then {
                private _sound = "";
                private _soundDistance = [15, 30] findIf {_distance < _x};
                if (_soundDistance isEqualTo -1) then {_soundDistance = 2};
                playSoundUI [selectRandom (GVAR(geigerSounds) select _soundDistance), 0.5];
            };

            private _threatLevel = _maximumThreat * (3 / _distance);
            _threatLevel = _threatLevel min _maximumThreat; // Chem detector maxes out at 9.99.
            _threatLevel = [_threatLevel, 2] call BIS_fnc_cutDecimals;

            // Increase / decrease threat level
            _detector ctrlAnimateModel ["Threat_Level_Source", _threatLevel, true];
        } else {
            _detector ctrlAnimateModel ["Threat_Level_Source", 0.00, true];
        };
    };
}, 1, [_markers, _enableGeigerSounds]] call CBA_fnc_addPerFrameHandler;
