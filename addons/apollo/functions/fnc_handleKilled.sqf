#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles killed event: registers the death on the website at once (the player then respawns with
 * basic gear, even if they disconnect before respawning). Stores the death's key (also its
 * bodybag's ID), the loadout and the variables at the moment of death on the body, and sends them
 * with the death. Runs where the unit is local: the player's machine.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call tac_apollo_fnc_handleKilled
 *
 * Public: No
 */

params ["_player"];
TRACE_1("Handle Killed",_this);

// The death's key and the loadout at the moment of death (the bodybag addon copies the key onto the bag)
private _deathKey = format ["%1-%2", getPlayerUID _player, (systemTimeUTC apply {str _x}) joinString ""];
_player setVariable [QGVAR(deathKey), _deathKey, true];
_player setVariable [QGVAR(deathLoadout), [_player] call FUNC(getLoadout), true];
_player setVariable [QGVAR(deathVariables), [_player] call FUNC(getVariables), true];

// Only a player's own death is registered (the UID is still valid now, not always after respawning)
if (_player isEqualTo player && {GVAR(enabled)} && {GVAR(enabledPlayers)}) then {
    [QGVAR(playerDied), [_player, getPlayerUID _player, _deathKey, _player getVariable QGVAR(deathLoadout), _player getVariable QGVAR(deathVariables)]] call CBA_fnc_serverEvent;
};
