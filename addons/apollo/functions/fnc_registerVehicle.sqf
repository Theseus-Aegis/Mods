#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Makes a vehicle or object persistent: it's saved with the others from now on, and removed from
 * Chronos once it's gone (FUNC(vehicleSaveServer)). Server only.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Vehicle ID <STRING> (default: its own, or a new one)
 *
 * Return Value:
 * Vehicle ID <STRING>
 *
 * Example:
 * [vehicle] call tac_apollo_fnc_registerVehicle
 *
 * Public: No
 */

params ["_vehicle", ["_vehicleID", ""]];

if (isNull _vehicle) exitWith {""};

if (_vehicleID == "") then {
    _vehicleID = _vehicle getVariable [QGVAR(vehicleID), ""];
};
if (_vehicleID == "") then {
    _vehicleID = ["generateUniqueID"] call FUNC(callServerExt);
};

_vehicle setVariable [QGVAR(vehicleID), _vehicleID, true];
GVAR(vehicles) set [_vehicleID, _vehicle];

TRACE_2("Vehicle registered",_vehicle,_vehicleID);
_vehicleID
