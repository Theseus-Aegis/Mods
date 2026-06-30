#include "script_component.hpp"
/*
 * Author: Jonpas
 * Loads runtime (current mission run) player data on the server.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player UID <STRING>
 * 2: Player Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "36182159512951925", "Banana"] call tac_apollo_fnc_playerSingletonLoad
 *
 * Public: No
 */

params ["_player", "_uid", "_name"];

private _playerRuntimeData = GVAR(playerRuntimeData) get _uid;
if (isNil "_playerRuntimeData") exitWith {}; // didn't actually disconnect
INFO_2("Player '%1' (%2) reconnected",_name,_uid);

_playerRuntimeData params ["_oldGroup", "_oldTeam", "_oldVehicle", "_oldMedical"];

// Group
if ((group _player) isNotEqualTo _oldGroup && {!isNull _oldGroup}) then {
    [_player] join _oldGroup;
};

// Team
if (assignedTeam _player != _oldTeam && {_oldTeam != ""}) then {
    _player assignTeam _oldTeam;
};

// Vehicle
if (!isNull _oldVehicle) then {
    if !(_player moveInAny _oldVehicle) then {
        WARNING_2("Failed to move player '%1' back into vehicle!",_player,_oldVehicle);
    };
};

// Medical
[_player, _oldMedical] call ACEFUNC(medical,deserializeState);

// Clear for correct disconect check
GVAR(playerRuntimeData) deleteAt _uid;
