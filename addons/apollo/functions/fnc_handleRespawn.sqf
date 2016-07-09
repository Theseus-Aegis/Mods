/*
 * Author: Jonpas
 * Handles respawn (kick back to lobby to force reinitialization).
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

[QGVAR(playerDied), _this] call CBA_fnc_serverEvent;

// @todo - reinitialize with new gear, todo in extension as well
["War... War never changes"] call FUNC(endMissionError);
