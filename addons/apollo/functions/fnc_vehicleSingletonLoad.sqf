#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Loads a single vehicle: Minotaur sends its data (the [key, value] pairs FUNC(vehicleSingletonSave)
 * sends, in pieces), and it's made here. Created high up with simulation off; FUNC(vehicleLoad)
 * turns simulation on once every vehicle is made. Server only.
 *
 * Arguments:
 * 0: Vehicle ID <STRING>
 *
 * Return Value:
 * Vehicle <OBJECT> (objNull if it couldn't be made)
 *
 * Example:
 * ["TACveh1"] call tac_apollo_fnc_vehicleSingletonLoad
 *
 * Public: No
 */

#define SPAWN_HEIGHT 1000
#define SPAWN_LIFT 0.5

params ["_vehicleID"];

private _pieces = [];
while {true} do {
    private _reply = ["getVehicle", _vehicleID] call FUNC(callServerExt);
    if (_reply in ["done", "error"]) exitWith {};
    _pieces pushBack _reply;
};

private _data = parseSimpleArray (_pieces joinString "");
if (_data isEqualTo []) exitWith {
    ERROR_1("Vehicle %1: no data from Chronos",_vehicleID);
    objNull
};
private _values = createHashMapFromArray _data;

private _type = _values getOrDefault ["type", ""];
private _position = _values getOrDefault ["position", []];
private _vehicle = missionNamespace getVariable [_vehicleID, objNull]; // only one the mission placed (Apollo)
private _csw = false;

if (_type != "" && {count _position == 3}) then {
    // Static objects (sandbags, trenches) are placed exactly as saved, the others lifted a little
    private _static = (_values getOrDefault ["class", "Unknown"]) == "Unknown" || {"trench" in _values};
    _position params ["_posX", "_posY", "_posZ"];
    if (!_static) then {
        _posZ = _posZ + SPAWN_LIFT;
    };

    _vehicle = createVehicle [_type, [_posX, _posY, SPAWN_HEIGHT], [], 0, "CAN_COLLIDE"];
    (_values getOrDefault ["customization", []]) params [["_textures", []], ["_animations", []]];
    if (_textures isNotEqualTo [] || {_animations isNotEqualTo []}) then {
        [_vehicle, [_textures, false] select (_textures isEqualTo []), [_animations, false] select (_animations isEqualTo []), true] call BIS_fnc_initVehicle;
    };
    _vehicle enableSimulationGlobal false;
    _vehicle allowDamage false;

    // ACE CSW's init (about a second later) empties a static weapon: assembly mode 2, as for a
    // deployed one, so it drops nothing on the ground; its saved magazines go in after that
    _csw = getNumber (configOf _vehicle >> "ace_csw" >> "enabled") == 1;
    if (_csw && {_values getOrDefault ["alive", true]} && {"turrets" in _values}) then {
        _vehicle setVariable [QACEGVAR(csw,assemblyMode), 2, true];
    };

    if ("direction" in _values) then {
        _vehicle setDir (_values get "direction");
    };
    _vehicle setPosATL [_posX, _posY, _posZ];
    if (_static && {"vector" in _values}) then {
        _vehicle setVectorDirAndUp (_values get "vector");
    };

    _vehicle setVehicleVarName _vehicleID;
    missionNamespace setVariable [_vehicleID, _vehicle];
    _vehicle setVariable [QGVAR(vehicleID), _vehicleID, true];
    _vehicle setVariable ["BIS_enableRandomization", false];

    if (_values getOrDefault ["alive", true]) then {
        [_vehicle, _values getOrDefault ["cargo", []]] call FUNC(setCargo);

        // ACE cargo: a class name as is; an object made, filled and loaded (registered again if
        // it's a persistent vehicle)
        {
            if (_x isEqualType "") then {
                [_x, _vehicle, 1, true] call ACEFUNC(cargo,addCargoItem);
            } else {
                _x params ["_class", "_damage", "_cargo", "_cargoID"];
                private _object = createVehicle [_class, [0, 0, 0], [], 0, "CAN_COLLIDE"];
                _object setDamage _damage;
                if (_cargoID != "") then {
                    [_object, _cargoID] call FUNC(registerVehicle);
                };
                [_object, _cargo] call FUNC(setCargo);
                [_object, _vehicle, true] call ACEFUNC(cargo,loadItem);
            };
        } forEach (_values getOrDefault ["ace_cargo", []]);

        // Pylons: setPylonLoadout's effect is local (ACE sends it to every machine), so it's also
        // sent to the players, including those who join later
        private _pylons = _values getOrDefault ["pylons", []];
        {
            _x params ["_index", "_turret", "_magazine", "_rounds"];
            private _loadout = [_index, _magazine, true, [_turret, []] select (_turret isEqualTo [-1])];
            _vehicle setPylonLoadout _loadout;
            [_vehicle, _loadout] remoteExecCall ["setPylonLoadout", -2, format ["%1_%2_%3", QGVAR(pylon), _vehicleID, _index]];
            _vehicle setAmmoOnPylon [_index, _rounds];
        } forEach _pylons;

        // Turrets: the magazines there now taken out (but the pylons'), the saved ones put in
        if ("turrets" in _values) then {
            private _onPylons = _pylons apply {_x select 2};
            private _turrets = (_values get "turrets") select {!((_x select 0) in _onPylons)};
            private _fill = {
                params ["_vehicle", "_turrets"];
                private _pylonMagazines = (getAllPylonsInfo _vehicle) apply {_x select 3};
                {
                    if !((_x select 0) in _pylonMagazines) then {
                        _vehicle removeMagazineTurret [_x select 0, _x select 1];
                    };
                } forEach magazinesAllTurrets _vehicle;
                {
                    _vehicle addMagazineTurret _x;
                } forEach _turrets;
            };
            if (_csw) then {
                [{((_this select 0) getVariable [QACEGVAR(csw,initialising), true]) isEqualTo false}, _fill, [_vehicle, _turrets], 15, _fill] call CBA_fnc_waitUntilAndExecute;
            } else {
                [_vehicle, _turrets] call _fill;
            };
        };

        if ("ace_fuel" in _values && {!isNil QACEFUNC(refuel,setFuel)}) then {
            [_vehicle, _values get "ace_fuel"] call ACEFUNC(refuel,setFuel);
        };
        if ("ace_ammo" in _values && {!isNil QACEFUNC(rearm,setSupplyCount)}) then {
            [_vehicle, _values get "ace_ammo"] call ACEFUNC(rearm,setSupplyCount);
        };
    };
};

if (isNull _vehicle) exitWith {
    ERROR_2("Vehicle %1 (%2) not made: no type or position",_vehicleID,_type);
    objNull
};

_vehicle allowDamage true;
_vehicle setVariable [QACEGVAR(cookoff,enableAmmoCookoff), false];
_vehicle setDamage [_values getOrDefault ["damage", 0], false];
{
    _vehicle setHitPointDamage [_x select 0, _x select 1, false];
} forEach (_values getOrDefault ["hitpoints", []]);
_vehicle setFuel (_values getOrDefault ["fuel", 1]);
if ("locked" in _values) then {
    _vehicle lock (_values get "locked");
};

// Trench progress the next frame, once the vehicles' simulation is on: grad_trenches shows it by
// animating the trench (ACE's trenches by its position, set above)
if ("trench" in _values) then {
    [{
        params ["_trench", "_progress"];
        _trench setVariable [QACEGVAR(trenches,progress), _progress, true];
        if (!isNil "grad_trenches_functions_fnc_setTrenchProgress") then {
            _trench setObjectTextureGlobal [0, surfaceTexture getPosASL _trench];
            [_trench, _progress] call grad_trenches_functions_fnc_setTrenchProgress;
        };
    }, [_vehicle, _values get "trench"]] call CBA_fnc_execNextFrame;
};

_vehicle
