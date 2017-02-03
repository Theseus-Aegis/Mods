/*
 * Author: Jonpas
 * Handles respawn event (mark in backend for fresh inventory).
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, corpse] call tac_apollo_fnc_handleRespawn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_corpse"];
TRACE_1("Handle Respawn",_this);

private _killerUID = _corpse getVariable [QGVAR(killerUID), ""];

[QGVAR(playerDied), [_player, _killerUID]] call CBA_fnc_serverEvent;
