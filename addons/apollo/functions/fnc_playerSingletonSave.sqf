/*
 * Author: Jonpas
 * Saves a player object and necessary variables.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player UID <STRING>
 * 2: Type ("save" or "validate") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "36182159512951925", "save", "loaded"] call tac_apollo_fnc_playerSingletonSave
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_uid", "_type"];

// Base
private _name = name _player;
private _playerPos = getPosASL _player;
private _playerDir = getDir _player;

// Loadout
private _loadout = getUnitLoadout _player;

// Remove "ItemRadioAcreFlagged"
if ((_loadout select 9) select 2 == "ItemRadioAcreFlagged") then {
    (_loadout select 9) set [2, ""];
};

// Set ACRE base classes
private _replaceRadioAcre = {
    if ([_this select 0] call acre_api_fnc_isRadio) then {
        _this set [0, [_this select 0] call acre_api_fnc_getBaseRadio];
    };
};
if !((_loadout select 3) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 3) select 1); // Uniform items
};
if !((_loadout select 4) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 4) select 1); // Vest items
};
if !((_loadout select 5) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 5) select 1); // Backpack items
};

// Other
private _inVehicle = (vehicle _player) != _player;
private _alive = alive _player;
private _selectedWeapon = currentWeapon _player;
private _currentStance = animationState _player;

// Variables
private _playerVariables = [];
/*{ //Disable until we decide on ACE medical vars
    if ((toLower (_x select [0, 3])) isEqualTo "ace") then {
        _playerVariables pushBack [_x, _playerObject getVariable [_x, "None"]];
    };
} forEach (allVariables _playerObject);*/

private _serverReply = ["storeInfantry", _type, _uid, _name, _playerPos, _playerDir, _loadout, _inVehicle, _alive, _selectedWeapon, _currentStance, _playerVariables] call FUNC(invokeJavaMethod);

TRACE_2("Singleton Save",_type,_serverReply);

if (_type == "validate" && {_serverReply == "success"}) exitWith {
    // No simulation toggling due to possible lag breaking correct position and direction setting
    ["infantryLoaded", _uid] call FUNC(invokeJavaMethod);
};

if (_serverReply == "terminated") then {
    [QGVAR(terminatePlayer), [_player], _player] call CBA_fnc_targetEvent;
};
