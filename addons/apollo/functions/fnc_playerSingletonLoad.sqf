#include "script_component.hpp"
/*
 * Author: Jonpas
 * Loads runtime (current mission run) player data on the server.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "36182159512951925"] call tac_apollo_fnc_playerSingletonLoad
 *
 * Public: No
 */

params ["_player", "_uid"];

private _playerRuntimeData = GVAR(playerRuntimeData) get _uid;
if (isNil "_playerRuntimeData") exitWith {}; // didn't actually disconnect

_playerRuntimeData params ["_oldGroup", "_oldVehicle"];

// Group
if ((group _player) isNotEqualTo _oldGroup && {!isNull _oldGroup}) then {
    [_player] join _oldGroup;
};

// Vehicle
if (!isNull _oldVehicle) then {
    if !(_player moveInAny _oldVehicle) then {
        WARNING_2("Failed to move player '%1' back into vehicle!",_player,_oldVehicle);
    };
};

// Clear for correct disconect check
GVAR(playerRuntimeData) deleteAt _uid;
