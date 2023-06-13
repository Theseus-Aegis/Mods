#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Toggle MFD (pilot or copilot) on the MELB.
 *
 * Arguments:
 * Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_melb_tweaks_fnc_toggleMFD
 *
 * Public: No
 */

params ["_vehicle"];

LOG_1("toggle MFD",_vehicle);

private _player = call CBA_fnc_currentUnit;

// Pilot
if (_player == driver _vehicle) then {
    if (_vehicle animationPhase "MFD_Pilot" > 0) then {
        _vehicle animate ["pilotpip", 0];
        _vehicle animate ["MFD_Pilot", 0];
    } else {
        _vehicle animate ["MFD_Pilot", 1];
        _vehicle animate ["pilotpip", 1];
    };
} else {
    // Copilot
    if (_player == gunner _vehicle) then {
        if (_vehicle animationPhase "MFD_CoPilot" > 0) then {
            _vehicle animate ["copilotpip", 0];
            _vehicle animate ["MFD_CoPilot", 0];
        } else {
            _vehicle animate ["MFD_CoPilot", 1];
            _vehicle animate ["copilotpip", 1];
        };
    };
};
