#include "..\script_component.hpp"
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
 * _vehicle call tac_compat_melb_fnc_toggleMFD
 *
 * Public: No
 */

params ["_vehicle"];
LOG_1("toggle MFD",_vehicle);

// Pilot
if (ACE_player == driver _vehicle) then {
    if (_vehicle animationPhase "MFD_Pilot" > 0) then {
        _vehicle animateSource ["pilotpip", 0];
        _vehicle animateSource ["MFD_Pilot", 0];
        GVAR(camera) cameraEffect ["Terminate", "BACK"];
    } else {
        _vehicle animateSource ["MFD_Pilot", 1];
        _vehicle animateSource ["pilotpip", 1];
        [_vehicle] call FUNC(setupMFD);
    };
} else {
    // Copilot
    if (ACE_player == gunner _vehicle) then {
        if (_vehicle animationPhase "MFD_CoPilot" > 0) then {
            _vehicle animateSource ["copilotpip", 0];
            _vehicle animateSource ["MFD_CoPilot", 0];
            GVAR(camera) cameraEffect ["Terminate", "BACK"];
        } else {
            _vehicle animateSource ["MFD_CoPilot", 1];
            _vehicle animateSource ["copilotpip", 1];
            [_vehicle] call FUNC(setupMFD);
        };
    };
};
