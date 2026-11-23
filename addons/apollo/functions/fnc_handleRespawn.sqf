#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles respawn event: the server reloads the player (basic gear, the death was registered when
 * they were killed; if it wasn't, the server registers it now from the corpse).
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

[QGVAR(playerRespawned), [_player, _corpse]] call CBA_fnc_serverEvent;
