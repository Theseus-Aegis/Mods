#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Saves a player object and necessary variables.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player UID <STRING>
 * 2: Player Name <STRING>
 * 3: Type ("save" or "validate") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "36182159512951925", "Banana", "save"] call tac_apollo_fnc_playerSingletonSave
 *
 * Public: No
 */

params ["_player", "_uid", "_name", "_type"];

if (_uid == "") exitWith {
    ERROR_1("Player not saved - UID (%1) undefined!",getPlayerUID _player);
};

// Base
private _playerPos = getPosASL _player;
private _playerDir = getDir _player;

// Loadout
private _loadout = [_player] call FUNC(getLoadout);

// Other
private _selectedWeapon = currentWeapon _player;

// Variables kept across missions, as the player's machine last sent them ([] if never: the website keeps its own)
private _playerVariables = (_player getVariable [QGVAR(clientState), []]) param [0, []];

private _serverReply = ["storeInfantry", _type, _uid, _name, _playerPos, _playerDir, _loadout, _selectedWeapon, _playerVariables] call FUNC(callServerExt);

TRACE_2("Singleton Save",_type,_serverReply);

if (_type == "validate" && {_serverReply == "success"}) exitWith {
    // No simulation toggling due to possible lag breaking correct position and direction setting
    ["infantryLoaded", _uid] call FUNC(callServerExt);
    INFO_4("Player '%1' (%2) validated successfully (Position: %3 - Loadout: %4)",_name,_uid,_playerPos,_loadout);
};

if (_serverReply == "terminated") then {
    [QGVAR(terminatePlayer), [_player], _player] call CBA_fnc_targetEvent;
    INFO_2("Player '%1' (%2) terminated - failed to load!",_name,_uid);
};
