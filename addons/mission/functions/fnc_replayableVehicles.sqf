#include "..\script_component.hpp"
/*
 * Author: Mike
 * Selects a random location and moves vehicles to it, area is used for getMissionLayerEntities. Used specifically for replayable missions with the current setup.
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 * 1: Area <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_myVehicles, "Name"] call MFUNC(replayableVehicles)
 */

params ["_vehicles", "_area"];

private _formatVehicleLocations = format ["%1 Vehicle Locations", _area];
private _vehicleLocations = (getMissionLayerEntities _formatVehicleLocations) select 0;

{
    private _object = selectRandom _vehicleLocations;
    private _position = getPosATL _object;
    private _direction = getDir _object;

    _vehicleLocations deleteAt (_vehicleLocations find _object);
    deleteVehicle _object;

    _x setPosATL _position;
    [QGVAR(setDir), [_x, _direction]] call CBA_fnc_globalEvent;
} forEach _vehicles;
