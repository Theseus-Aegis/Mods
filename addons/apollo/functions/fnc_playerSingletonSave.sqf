#include "script_component.hpp"
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

// Base
private _playerPos = getPosASL _player;
private _playerDir = getDir _player;

// Loadout
private _loadout = getUnitLoadout _player;

// Filter ACRE2
if (["acre_api"] call ACEFUNC(common,isModLoaded)) then {
    _loadout = [_loadout] call acre_api_fnc_filterUnitLoadout;
};

// Add earplugs to uniform if has them plugged in (temporary until Variables support)
if (_player call ACEFUNC(hearing,hasEarPlugsIn) && {!((_loadout select 3) isEqualTo [])}) then {
    ((_loadout select 3) select 1) pushBack ["ACE_EarPlugs", 1];
};

// Other
private _inVehicle = (vehicle _player) != _player;
private _alive = alive _player;
private _selectedWeapon = currentWeapon _player;

// Variables TODO
private _playerVariables = [];

private _serverReply = ["storeInfantry", _type, _uid, _name, _playerPos, _playerDir, _loadout, _inVehicle, _alive, _selectedWeapon, _playerVariables] call FUNC(invokeJavaMethod);

TRACE_2("Singleton Save",_type,_serverReply);

if (_type == "validate" && {_serverReply == "success"}) exitWith {
    // No simulation toggling due to possible lag breaking correct position and direction setting
    ["infantryLoaded", _uid] call FUNC(invokeJavaMethod);
    INFO_2("Player '%1' (%2) validated successfully",_name,_uid);
};

if (_serverReply == "terminated") then {
    [QGVAR(terminatePlayer), [_player], _player] call CBA_fnc_targetEvent;
    INFO_2("Player '%1' (%2) terminated - failed to load!",_name,_uid);
};
