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

params ["_vehicle"];

private _vehicleID = _vehicle getVariable [QGVAR(vehicleID), ""];
if (isNull _vehicle || {_vehicleID == ""}) exitWith {};

private _config = configOf _vehicle;
private _alive = alive _vehicle;

private _hitpoints = [];
private _configHitpoints = _config >> "HitPoints";
for "_i" from 0 to (count _configHitpoints - 1) do {
    private _hitpoint = configName (_configHitpoints select _i);
    private _damage = _vehicle getHitPointDamage _hitpoint;
    if (!isNil "_damage") then {
        _hitpoints pushBack [_hitpoint, _damage];
    };
};

// Unknown class (static objects) is placed exactly as saved, all other classes get height added on spawn
private _vehicleClass = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Plane"): {"Plane"};
    case (_vehicle isKindOf "Helicopter"): {"Helicopter"};
    case (_vehicle isKindOf "Tank"): {"Tank"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
    case (_vehicle isKindOf "ThingX"): {"ObjectPhysX"};
    default {"Unknown"};
};

// Settings: static weapons (with ACE CSW tripods) and objects that aren't vehicles (trenches,
// sandbags, fortifications, crates) can be left out
private _trenchProgress = _vehicle getVariable QACEGVAR(trenches,progress);
private _staticWeapon = _vehicle isKindOf "StaticWeapon" || {_vehicle isKindOf "ace_csw_baseTripod"};
if (!GVAR(vehiclesStaticWeapons) && {_staticWeapon}) exitWith {};
if (!GVAR(vehiclesObjects) && {!_staticWeapon} && {!(_vehicle isKindOf "AllVehicles")}) exitWith {};

// [key, value] pairs, read by Minotaur (apollo/vehicles.py)
private _data = [
    ["position", getPosATL _vehicle],
    ["direction", getDir _vehicle],
    ["vector", [vectorDir _vehicle, vectorUp _vehicle]],
    ["type", typeOf _vehicle],
    ["class", _vehicleClass],
    ["name", getText (_config >> "displayName")],
    ["alive", _alive],
    ["damage", damage _vehicle],
    ["hitpoints", _hitpoints],
    ["fuel", fuel _vehicle],
    ["locked", locked _vehicle],
    ["customization", [_vehicle] call BIS_fnc_getVehicleCustomization] // [textures, animations]
];

if (_alive) then {
    // ACE cargo: a class name as is, a loaded object (a crate, a quad) with its damage, inventory and
    // persistent vehicle ID (saved with this vehicle while it's loaded)
    private _aceCargo = [];
    {
        if (_x isEqualType "") then {
            _aceCargo pushBack _x;
        } else {
            if (!isNull _x) then {
                _aceCargo pushBack [typeOf _x, damage _x, [_x] call FUNC(getCargo), _x getVariable [QGVAR(vehicleID), ""]];
            };
        };
    } forEach (_vehicle getVariable [QACEGVAR(cargo,loaded), []]);

    _data pushBack ["cargo", [_vehicle] call FUNC(getCargo)];
    if (GVAR(vehiclesACECargo)) then {
        _data pushBack ["ace_cargo", _aceCargo];
    };
    if (GVAR(vehiclesTurrets)) then {
        _data pushBack ["turrets", magazinesAllTurrets _vehicle];
    };
    if (GVAR(vehiclesPylons)) then {
        // Without the pylon objects (written as "NOID x.p3d" or <NULL-object>, not data)
        _data pushBack ["pylons", (getAllPylonsInfo _vehicle) apply {_x select [0, 5]}];
    };

    // ACE fuel truck (finite fuel)
    if (GVAR(vehiclesACESupply) && {!isNil QACEFUNC(refuel,getCapacity)} && {([_vehicle] call ACEFUNC(refuel,getCapacity)) > 0}) then {
        _data pushBack ["ace_fuel", [_vehicle] call ACEFUNC(refuel,getFuel)];
    };

    // ACE ammo truck: limited supply (a count) or magazine-specific supply (what's stored in it);
    // unlimited needs nothing
    private _rearmSupply = missionNamespace getVariable [QACEGVAR(rearm,supply), 0];
    if (GVAR(vehiclesACESupply) && {_rearmSupply == 2} && {!isNil {_vehicle getVariable QACEGVAR(rearm,magazineSupply)}}) then {
        _data pushBack ["ace_ammo_magazines", _vehicle getVariable QACEGVAR(rearm,magazineSupply)];
    };
    if (
        GVAR(vehiclesACESupply) && {!isNil QACEFUNC(rearm,getSupplyCount)} && {_rearmSupply == 1} &&
        {!isNil {_vehicle getVariable QACEGVAR(rearm,currentSupply)} || {getNumber (_config >> QACEGVAR(rearm,defaultSupply)) > 0} || {getNumber (_config >> "transportAmmo") > 0}}
    ) then {
        _data pushBack ["ace_ammo", [_vehicle] call ACEFUNC(rearm,getSupplyCount)];
    };
};

// Trench dig progress (ACE, grad_trenches)
if (!isNil "_trenchProgress") then {
    _data pushBack ["trench", _trenchProgress];
};

["storeVehicle", _vehicleID, _data] call FUNC(callServerExt);
