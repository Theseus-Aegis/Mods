/*
 * Author: Jonpas
 * Handles killed event (mark in backend for fresh inventory).
 * Resets inventory in combination with Respawn event. UID is not valid after quick respawn in Killed event.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, killer] call tac_apollo_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_killer"];
TRACE_1("Handle Killed",_this);

private _killerUID = getPlayerUID _killer;

// Try to get UID from ACE3's damage source (ace_medical uses setDamage which makes killer always objNull)
if (_killerUID == "") then {
    _killerUID = getPlayerUID (_player getVariable ["ace_medical_lastDamageSource", objNull]);

    // No valid UID found, assume killer was AI or Self
    if (_killerUID == "") then {
        _killerUID = "AI/Self";
    };
};

// Save Killed EH data for use in Respawn EH
_player setVariable [QGVAR(killerUID), _killerUID];
