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

params ["_playerObject", "_id", "_type"];

// Base
private _name = name _playerObject;
private _playerPos = getPosASL _playerObject;
private _playerDir = getDir _playerObject;
private _playerHeadgear = headgear _playerObject;
private _playerGoggles = goggles _playerObject;

// Uniform
private _uniform = uniform _playerObject;
private _uniformCargo = [];
private _uniformMagazines = [];
private _uniformWeapons = [];

if (_uniform != "") then {
    private _uniformContainer = uniformContainer _playerObject;
    _uniformCargo append (itemCargo _uniformContainer);
    _uniformMagazines append (getMagazineCargo _uniformContainer);
    _uniformWeapons append (weaponsItems _uniformContainer);
};

// Vest
private _vest = vest _playerObject;
private _vestCargo = [];
private _vestMagazines = [];
private _vestWeapons = [];

if (_vest != "") then {
    private _vestContainer = vestContainer _playerObject;
    _vestCargo append (itemCargo _vestContainer);
    _vestMagazines append (getMagazineCargo _vestContainer);
    _vestWeapons append (weaponsItems _vestContainer);
};

// Backpack
private _backpack = backpack _playerObject;
private _backpackCargo = [];
private _backpackMagazines = [];
private _backpackWeapons = [];

if (_backpack != "") then {
    private _backpackContainer = backpackContainer _playerObject;
    _backpackCargo append (itemCargo _backpackContainer);
    _backpackMagazines append (getMagazineCargo _backpackContainer);
    _backpackWeapons append (weaponsItems _backpackContainer);
};

// Inventory
private _inventory = assignedItems _playerObject;

// Weapons
private _primaryWeapon = primaryWeapon _playerObject;
private _secondaryWeapon = secondaryWeapon _playerObject;
private _handgunWeapon = handgunWeapon _playerObject;

private _weapons = [];
_weapons pushBack _primaryWeapon;
_weapons pushBack _secondaryWeapon;
_weapons pushBack _handgunWeapon;

// Primary Weapon Attachments
private _primaryWepAttachments = [];
if (_primaryWeapon != "" ) then {
    _primaryWepAttachments append (primaryWeaponItems _playerObject);
};

// Secondary Weapon Attachments
private _secondaryWepAttachments = [];
if (_secondaryWeapon != "" ) then {
    _secondaryWepAttachments append (secondaryWeaponItems _playerObject);
};

// Handgun Attachments
private _handgunAttachments = [];
if (_handgunWeapon != "" ) then {
    _handgunAttachments append (handgunItems _playerObject);
};

// Weapon Magazines
private _weaponMagazines = [];
_weaponMagazines pushBack (primaryWeaponMagazine _playerObject);
_weaponMagazines pushBack (secondaryWeaponMagazine _playerObject);
_weaponMagazines pushBack (handgunMagazine _playerObject);

// Other
private _inVehicle = (vehicle _playerObject) != _playerObject;
private _alive = alive _playerObject;
private _selectedWeapon = currentWeapon _playerObject;
private _currentStance = animationState _playerObject;
private _fatigue = getFatigue _playerObject;

// Variables
private _playerVariables = [];
//Disable until we decide on ACE medical vars
/**
{
    if ((toLower (_x select [0, 3])) isEqualTo "ace") then {
        _playerVariables pushBack [_x, _playerObject getVariable [_x, "None"]];
    };
} forEach (allVariables _playerObject);
**/

private _serverReply = ["storeInfantry", _type, _id, _name, _playerPos, _playerDir, _playerHeadgear, _playerGoggles, _uniform, _uniformCargo, _uniformMagazines, _vest, _vestCargo, _vestMagazines, _backpack, _backpackCargo, _backpackMagazines, _inventory, _weapons, _primaryWepAttachments, _secondaryWepAttachments, _handgunAttachments , _weaponMagazines, _inVehicle, _alive, _selectedWeapon, _currentStance, _fatigue, _uniformWeapons, _vestWeapons, _backpackWeapons, _playerVariables] call FUNC(invokeJavaMethod);

if (_type == "validate" && {_serverReply == "success"}) then {
    _playerObject enableSimulationGlobal true;
    _playerObject hideObjectGlobal false;
    ["infantryLoaded", _id] call FUNC(invokeJavaMethod);
};

if (_serverReply == "terminated") then {
    [QGVAR(terminatePlayer), [], _playerObject] call CBA_fnc_targetEvent;
};
