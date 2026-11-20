#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Tests saving and loading a vehicle: saves it, deletes it, loads it back from Chronos and compares
 * what it has (cargo with containers and rounds, turret magazines, pylons, damage, fuel, trench
 * progress, ACE cargo). The vehicle is replaced by the loaded one. Results in the server's RPT and
 * in everyone's chat. For test servers (the development website), server only.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] remoteExec ["tac_apollo_fnc_testVehicleRoundTrip", 2]
 *
 * Public: No
 */

params [["_vehicle", objNull, [objNull]]];

if (!isServer || {isNull _vehicle} || {!GVAR(vehiclesLoaded)}) exitWith {
    ERROR_1("Vehicle round trip: needs a vehicle, on the server, once vehicles are loaded (%1)",_vehicle);
};

[_vehicle, [_vehicle] call FUNC(registerVehicle)] spawn {
    params ["_vehicle", "_vehicleID"];

    private _report = {
        params ["_text"];
        INFO_1("Vehicle round trip: %1",_text);
        [format ["Vehicle round trip: %1", _text]] remoteExecCall ["systemChat", 0];
    };
    private _sorted = {
        params ["_list"];
        private _strings = _list apply {str _x};
        _strings sort true;
        _strings
    };
    private _snapshot = {
        params ["_object"];
        ([_object] call FUNC(getCargo)) params ["_items", "_magazines", "_weapons", "_containers"];
        [
            typeOf _object,
            (getPosATL _object select [0, 2]) apply {round _x},
            round (damage _object * 100),
            round (fuel _object * 100),
            [_items] call _sorted,
            [_magazines] call _sorted,
            [_weapons] call _sorted,
            [_containers apply {_x params ["_class", "_isBackpack", "_inside"]; [_class, _isBackpack, _inside apply {[_x] call _sorted}]}] call _sorted,
            [(magazinesAllTurrets _object) apply {_x select [0, 3]}] call _sorted,
            [(getAllPylonsInfo _object) apply {[_x select 0, _x select 3, _x select 4]}] call _sorted,
            _object getVariable [QACEGVAR(trenches,progress), -1],
            [(_object getVariable [QACEGVAR(cargo,loaded), []]) apply {if (_x isEqualType objNull) then {typeOf _x} else {_x}}] call _sorted
        ]
    };
    private _names = ["type", "position", "damage", "fuel", "items", "magazines", "weapons", "containers", "turrets", "pylons", "trench", "ACE cargo"];

    private _before = [_vehicle] call _snapshot;
    [format ["%1 (%2) saving, deleting and loading", _vehicleID, typeOf _vehicle]] call _report;

    [_vehicle] call FUNC(vehicleSingletonSave);
    sleep 3; // sent in the background

    GVAR(vehicles) deleteAt _vehicleID; // not removed from Chronos while it's away
    {
        if (_x isEqualType objNull) then {deleteVehicle _x};
    } forEach (_vehicle getVariable [QACEGVAR(cargo,loaded), []]);
    deleteVehicle _vehicle;
    sleep 1;

    if ((["retrieveAllVehicles"] call FUNC(callServerExt)) != "ready") exitWith {
        ["failed: vehicles not retrieved from Chronos"] call _report;
    };
    [_vehicleID] call FUNC(vehicleSingletonLoad);

    private _loaded = missionNamespace getVariable [_vehicleID, objNull];
    if (isNull _loaded) exitWith {
        [format ["failed: %1 not loaded", _vehicleID]] call _report;
    };
    [_loaded, _vehicleID] call FUNC(registerVehicle);
    _loaded enableSimulationGlobal true;
    sleep 20; // ACE CSW's init and a static weapon's ammo after it (up to 15 s), physics settling

    private _after = [_loaded] call _snapshot;
    private _differences = [];
    {
        if (_x isNotEqualTo (_after select _forEachIndex)) then {
            _differences pushBack (_names select _forEachIndex);
            INFO_2("Vehicle round trip: %1 before %2",_names select _forEachIndex,_x);
            INFO_2("Vehicle round trip: %1 after  %2",_names select _forEachIndex,_after select _forEachIndex);
        };
    } forEach _before;

    if (_differences isEqualTo []) then {
        [format ["%1 OK, the same after loading", _vehicleID]] call _report;
    } else {
        [format ["%1 DIFFERS in %2 (details in the server's RPT)", _vehicleID, _differences joinString ", "]] call _report;
    };
};
