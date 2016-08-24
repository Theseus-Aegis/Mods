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
_killerUID = [_killerUID, "AI/Self"] select (_killerUID == "");

// Save Killed EH data for use in Respawn EH
_player setVariable [QGVAR(killerUID), _killerUID];
