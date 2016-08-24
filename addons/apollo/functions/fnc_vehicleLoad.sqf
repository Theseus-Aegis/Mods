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

    _vehList = (_vehList apply {missionNamespace getVariable [_x, objNull]}) select {!isNull _x};
    TRACE_1("Vehicles loaded with disabled damage",_vehList);

    // Allow damage and enable simulation on all vehicles
    {
        _x enableSimulationGlobal true;
        _x allowDamage true;
    } forEach _vehList;

    // Set vehicles loaded flag
    GVAR(vehiclesLoaded) = true;
    publicVariable QGVAR(vehiclesLoaded);

    ACE_LOGINFO_1("%1 vehicle(s) loaded.",count _vehList);

    // Start saving vehicles
    [FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
} else {
    ACE_LOGERROR("Failed to retrieve vehicles list!");
};
