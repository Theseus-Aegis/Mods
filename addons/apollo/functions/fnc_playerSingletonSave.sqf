/*
 * Author: Jonpas
 * Saves a player object and necessary variables.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player UID <STRING>
 * 2: Validate/Save <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "36182159512951925", "save"] call tac_apollo_fnc_playerSingletonSave
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_uid", "_type"];

// Base
private _name = name _player;
private _playerPos = getPosASL _player;
private _playerDir = getDir _player;
private _playerHeadgear = headgear _player;
private _playerGoggles = goggles _player;

// Uniform
private _uniform = uniform _player;
private _uniformCargo = [];
private _uniformMagazines = [];
private _uniformWeapons = [];

if (_uniform != "") then {
    private _uniformContainer = uniformContainer _player;
    _uniformCargo append (itemCargo _uniformContainer);
    _uniformMagazines append (getMagazineCargo _uniformContainer);
    _uniformWeapons append (weaponsItems _uniformContainer);
};

// Vest
private _vest = vest _player;
private _vestCargo = [];
private _vestMagazines = [];
private _vestWeapons = [];

if (_vest != "") then {
    private _vestContainer = vestContainer _player;
    _vestCargo append (itemCargo _vestContainer);
    _vestMagazines append (getMagazineCargo _vestContainer);
    _vestWeapons append (weaponsItems _vestContainer);
};

// Backpack
private _backpack = backpack _player;
private _backpackCargo = [];
private _backpackMagazines = [];
private _backpackWeapons = [];

if (_backpack != "") then {
    private _backpackContainer = backpackContainer _player;
    _backpackCargo append (itemCargo _backpackContainer);
    _backpackMagazines append (getMagazineCargo _backpackContainer);
    _backpackWeapons append (weaponsItems _backpackContainer);
};

// Inventory
private _inventory = assignedItems _player;

// Weapons
private _primaryWeapon = primaryWeapon _player;
private _secondaryWeapon = secondaryWeapon _player;
private _handgunWeapon = handgunWeapon _player;

private _weapons = [];
_weapons pushBack _primaryWeapon;
_weapons pushBack _secondaryWeapon;
_weapons pushBack _handgunWeapon;

// Primary Weapon Attachments
private _primaryWepAttachments = [];
if (_primaryWeapon != "" ) then {
    _primaryWepAttachments append (primaryWeaponItems _player);
};

// Secondary Weapon Attachments
private _secondaryWepAttachments = [];
if (_secondaryWeapon != "" ) then {
    _secondaryWepAttachments append (secondaryWeaponItems _player);
};

// Handgun Attachments
private _handgunAttachments = [];
if (_handgunWeapon != "" ) then {
    _handgunAttachments append (handgunItems _player);
};

// Weapon Magazines
private _weaponMagazines = [];
_weaponMagazines pushBack (primaryWeaponMagazine _player);
_weaponMagazines pushBack (secondaryWeaponMagazine _player);
_weaponMagazines pushBack (handgunMagazine _player);

// Other
private _inVehicle = (vehicle _player) != _player;
private _alive = alive _player;
private _selectedWeapon = currentWeapon _player;
private _currentStance = animationState _player;
private _fatigue = getFatigue _player;

// Variables
private _playerVariables = [];
/*{ //Disable until we decide on ACE medical vars
    if ((toLower (_x select [0, 3])) isEqualTo "ace") then {
        _playerVariables pushBack [_x, _playerObject getVariable [_x, "None"]];
    };
} forEach (allVariables _playerObject);*/

private _serverReply = ["storeInfantry", _type, _uid, _name, _playerPos, _playerDir, _playerHeadgear, _playerGoggles, _uniform, _uniformCargo, _uniformMagazines, _vest, _vestCargo, _vestMagazines, _backpack, _backpackCargo, _backpackMagazines, _inventory, _weapons, _primaryWepAttachments, _secondaryWepAttachments, _handgunAttachments , _weaponMagazines, _inVehicle, _alive, _selectedWeapon, _currentStance, _fatigue, _uniformWeapons, _vestWeapons, _backpackWeapons, _playerVariables] call FUNC(invokeJavaMethod);

TRACE_2("Singleton Save",_type,_serverReply);

if (_type == "validate" && {_serverReply == "success"}) then {
    // No simulation toggling due to possible lag breaking correct position and direction setting
    _player hideObjectGlobal false;
    ["infantryLoaded", _uid] call FUNC(invokeJavaMethod);
};

if (_serverReply == "terminated") then {
    [QGVAR(terminatePlayer), [], _player] call CBA_fnc_targetEvent;
};
