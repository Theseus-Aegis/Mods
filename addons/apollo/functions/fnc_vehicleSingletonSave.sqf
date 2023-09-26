#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Saves a single vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call tac_apollo_fnc_vehicleSingletonSave
 *
 * Public: No
 */

params ["_vehicleObject"];

private _vehicleID = _vehicleObject getVariable QGVAR(vehicleID);
private _vehicleType = typeOf _vehicleObject;

private _hitpoints = [];
private _configHitpoints = configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints";

for "_i" from 0 to (count _configHitpoints - 1) do {
    private _hitpointEntry = configName (_configHitpoints select _i);
    private _hitpointHealth = _vehicleObject getHitPointDamage _hitpointEntry;
    _hitpoints pushBack [_hitpointEntry, _hitpointHealth];
};

private _vehiclePos = getPosATL _vehicleObject;
private _vehicleDir = getDir _vehicleObject;
private _vehicleAlive = alive _vehicleObject;
private _vehicleDamage = damage _vehicleObject;


private _driver = "";
private _vehicleCrew = [];
if (_vehicleObject isKindOf "AllVehicles") then {
    _driver = name (driver _vehicleObject);
    {
        _vehicleCrew pushBack [getPlayerUID _x, name _x];
    } forEach (crew _vehicleObject);
};

// Unknown class does not get height added on spawn, all other defined classes do
private _vehicleClass = switch (true) do {
    case (_vehicleObject isKindOf "Car"): {"Car"};
    case (_vehicleObject isKindOf "Plane"): {"Plane"};
    case (_vehicleObject isKindOf "Helicopter"): {"Helicopter"};
    case (_vehicleObject isKindOf "Tank"): {"Tank"};
    case (_vehicleObject isKindOf "Ship"): {"Ship"};
    case (_vehicleObject isKindOf "ThingX"): {"ObjectPhysX"};
    default {"Unknown"};
};

private _vehicleFuel = fuel _vehicleObject;
private _vehicleLock = locked _vehicleObject;
private _vehicleCustomization = [_vehicleObject, ""] call BIS_fnc_exportVehicle;

private _vehicleAmmo = [];
private _vehicleMagazineCargo = [];
private _vehicleItemCargo = [];
private _vehicleWeapons = [];
private _vehicleBackPacks = [];

private _vehicleBackpackItems = [];
private _vehicleBackpackMagazines = [];
private _vehicleBackpackWeapons = [];


if (_vehicleAlive) then {
    _vehicleAmmo = magazinesAmmo _vehicleObject;
    _vehicleMagazineCargo =  getMagazineCargo _vehicleObject;
    _vehicleItemCargo =  itemCargo _vehicleObject;
    _vehicleWeapons = weaponsItemsCargo _vehicleObject;
    _vehicleBackPacks = getBackpackCargo _vehicleObject;

    {
        _x params ["", "_container"];
        _vehicleBackpackItems append (itemCargo _container);
        _vehicleBackpackMagazines append (getMagazineCargo _container);
        _vehicleBackpackWeapons append (weaponsItems _container);
    } forEach (everyContainer _vehicleObject);
};

private _vehicleNamePretty = getText (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");

["storeVehicle", _vehicleID, _vehiclePos, _vehicleDir, _vehicleType, _vehicleClass, _vehicleAlive, _vehicleDamage, _hitpoints, _vehicleFuel, _vehicleAmmo, _vehicleMagazineCargo, _vehicleItemCargo, _vehicleWeapons, _vehicleCrew, _vehicleBackPacks, _vehicleBackpackItems, _vehicleBackpackMagazines, _vehicleBackpackWeapons, _driver, _vehicleNamePretty, _vehicleLock, _vehicleCustomization] call FUNC(invokeJavaMethod);
