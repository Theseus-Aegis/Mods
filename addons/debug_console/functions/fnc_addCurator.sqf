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

// Early exit if Module already assigned.
if (!isNull getAssignedCuratorLogic _player) exitWith {};

private _curatorGroup = createGroup sideLogic;
private _curatorModule = _curatorGroup createUnit ["ModuleCurator_F", _player, [], 0, "NONE"];
private _configFile = (configFile >> "CfgPatches");
private _allAddons = [];

GVAR(playerCurators) pushBack [_curatorModule, getPlayerUID _player];

for "_i" from 1 to (count _configFile) do {
    private _cfgName = configName (_configFile select _i);
    _allAddons pushBack _cfgName;
};

_curatorModule addCuratorAddons _allAddons;
_curatorModule setVariable ["showNotification", false];
_curatorModule addCuratorEditableObjects [allUnits, true]; // all Players and AI.

{
    _curatorModule setCuratorCoef [_x, 0];
} forEach ["Place", "Edit", "Delete", "Destroy", "Group", "Synchronize"];

_player assignCurator _curatorModule;
