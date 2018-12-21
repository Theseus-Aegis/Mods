#include "script_component.hpp"
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

private _retrieveVehicles = ["retrieveAllVehicles"] call FUNC(invokeJavaMethod);

if (_retrieveVehicles == "ready") then {
    private _vehList = [];
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

    // Make sure all vehicles exist, save them into a global variable for API
    _vehList = (_vehList apply {missionNamespace getVariable [_x, objNull]}) select {!isNull _x};
    GVAR(vehiclesList) = +_vehList; // Don't use global variable directly in case of new vehicles during this time

    // Allow damage and enable simulation on all vehicles
    {
        _x enableSimulationGlobal true;
        _x allowDamage true;

        // Fix possible issue where physics don't activate until doing it manually (eg. shooting the object)
        _x setDamage [damage _x, false];
    } forEach _vehList;

    // Set vehicles loaded flag
    GVAR(vehiclesLoaded) = true;
    publicVariable QGVAR(vehiclesLoaded);

    INFO_1("%1 vehicles loaded.",count _vehList);
    TRACE_1("Vehicles loaded",_vehList);

    // Start saving vehicles
    [FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
} else {
    ERROR("Failed to retrieve vehicles list!");
};
