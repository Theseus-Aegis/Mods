#include "..\script_component.hpp"
/*
 * Author: Mike
 * Creates curator module for the local player.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_player"];

private _playerName = name _player;

// Early exit if Module already assigned.
if (!isNull getAssignedCuratorLogic _player) exitWith {
    INFO_1("Player '%1' already assigned as curator.",_playerName);
};

INFO_1("Player '%1' assigned as Curator",_playerName);

private _curatorGroup = createGroup sideLogic;
private _curatorModule = _curatorGroup createUnit ["ModuleCurator_F", _player, [], 0, "NONE"];
private _configFile = (configFile >> "CfgPatches");
private _allAddons = [];

GVAR(playerCurators) pushBack [_curatorModule, getPlayerUID _player];

for "_i" from 0 to (count _configFile - 1) do {
    private _cfgName = configName (_configFile select _i);
    _allAddons pushBack _cfgName;
};

private _entities = entities [[], [], true, true]; // Players, AI and Vehicles.

_curatorModule addCuratorAddons _allAddons;
_curatorModule setVariable ["showNotification", false];
_curatorModule setVariable ["BIS_fnc_initModules_activate", true, true];
_curatorModule addCuratorEditableObjects [_entities, true];

{
    _curatorModule setCuratorCoef [_x, 0];
} forEach ["Place", "Edit", "Delete", "Destroy", "Group", "Synchronize"];

_player assignCurator _curatorModule;
