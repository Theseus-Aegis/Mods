#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Makes a vehicle or object persistent: it's saved with the others from now on, and removed from
 * Chronos a second after it's deleted (packed up, deleted in Zeus, a wreck cleaned up). Server only.
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

if (isNil {_vehicle getVariable QGVAR(deletedHandler)}) then {
    _vehicle setVariable [QGVAR(deletedHandler), _vehicle addEventHandler ["Deleted", {
        params ["_vehicle"];
        // A second later, and only if it's still registered and gone (not replaced, as the round-trip
        // test does): a mission ending deletes every object but runs no more of the mission's
        // timers, so nothing is removed then
        [{
            params ["_vehicleID"];
            if (_vehicleID in GVAR(vehicles) && {isNull (GVAR(vehicles) get _vehicleID)}) then {
                GVAR(vehicles) deleteAt _vehicleID;
                ["removeVehicle", _vehicleID] call FUNC(callServerExt);
                INFO_1("Vehicle %1 deleted, removed from Chronos",_vehicleID);
            };
        }, [_vehicle getVariable [QGVAR(vehicleID), ""]], 1] call CBA_fnc_waitAndExecute;
    }]];
};

TRACE_2("Vehicle registered",_vehicle,_vehicleID);
_vehicleID
