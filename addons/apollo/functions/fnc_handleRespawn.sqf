#include "..\script_component.hpp"
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

params ["_player", "_corpse"];
TRACE_1("Handle Respawn",_this);

private _killerUID = _corpse getVariable [QGVAR(killerUID), ""];
private _deathKey = _corpse getVariable [QGVAR(deathKey), ""];
private _deathLoadout = _corpse getVariable [QGVAR(deathLoadout), []];

[QGVAR(playerDied), [_player, _killerUID, _deathKey, _deathLoadout]] call CBA_fnc_serverEvent;
