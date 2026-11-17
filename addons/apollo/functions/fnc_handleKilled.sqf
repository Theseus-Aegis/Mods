#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles killed event (mark in backend for fresh inventory).
 * Resets inventory in combination with Respawn event. UID is not valid after quick respawn in Killed event.
 * Stores the death's key (also its bodybag's ID), the loadout and the variables at the moment of death on the body,
 * sent with the death.
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
