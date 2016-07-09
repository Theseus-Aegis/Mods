/*
 * Author: Jonpas
 * Loads vehicles.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_apollo_fnc_vehicleLoad
 *
 * Public: No
 */
#include "script_component.hpp"

private _retrieveVehicles = ["retrieveAllVehicles"] call FUNC(invokeJavaMethod);
private _vehList = [];

if (_retrieveVehicles == "ready") then {
    private _updateInfo = true;

    while {_updateInfo} do {
        private _serverReply = ["getVehicleList"] call FUNC(invokeJavaMethod);

        // All vehicle IDs retrieved
        if (_serverReply == "done") then {
            _updateInfo = false;
            {
                [_x] call FUNC(vehicleSingletonLoad);
            } forEach _vehList;
        } else {
            _vehList pushBack _serverReply;
        };
    };
};

// Allow damage on vehicles once all loaded and start saving
[{
    (["isVehiclesAllLoaded"] call FUNC(invokeJavaMethod)) isEqualTo "true"
}, {
    {
        private _vehicleID = _x getVariable ["vehicleChronosID", "None"];
        if (_vehicleID select [0, 3] == "TAC") then {
            _x allowDamage true;
        };
    } forEach vehicles;

    // Set Chronos flag
    tac_chronos_loaded = true;
    publicVariable "tac_chronos_loaded";

    // Start saving vehicles
    [FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
