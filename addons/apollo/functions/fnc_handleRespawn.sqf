#include "script_component.hpp"
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

[QGVAR(playerDied), [_player, _killerUID]] call CBA_fnc_serverEvent;
