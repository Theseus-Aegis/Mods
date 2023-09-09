#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Loads a single vehicle.
 *
 * Arguments:
 * 0: Vehicle ID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["TACveh1"] call tac_apollo_fnc_vehicleSingletonLoad
 *
 * Public: No
 */

params ["_vehicleID"];

private _responsePacket = [];
private _updateInfo = true;

while {_updateInfo} do {
    private _serverReply = ["getVehicle", _vehicleID] call FUNC(invokeJavaMethod);

    if (_serverReply == "done") then {
        {
            call _x;
        } forEach _responsePacket;

        _responsePacket = [];
        _updateInfo = false;
    } else {
        _responsePacket pushBack (compile _serverReply);
    };
};
