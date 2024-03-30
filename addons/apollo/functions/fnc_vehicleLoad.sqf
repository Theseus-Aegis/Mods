#include "..\script_component.hpp"
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

    // Enable simulation on all vehicles and attempt to fix physics
    {
        // Disable damage until some time later to avoid damage due to height drop on simulation enable
        _x allowDamage false;
        [{
            _this allowDamage true;
        }, _x, 5] call CBA_fnc_waitAndExecute;

        _x enableSimulationGlobal true;

        // Fix possible issue where physics don't activate until doing it manually (eg. shooting the object)
        private _vehDamage = getAllHitPointsDamage _x;
        _x setDamage [damage _x, false];

        private _vehicle = _x;
        _vehDamage params ["_hitPoints", "", "_hitPointsDamage"];
        {
            _vehicle setHitPointDamage [_x, _hitPointsDamage select _forEachIndex, false];
        } forEach _hitPoints;
    } forEach _vehList;

    // Set vehicles loaded flag
    GVAR(vehiclesLoaded) = true;

    INFO_1("%1 vehicles loaded.",count _vehList);
    TRACE_1("Vehicles loaded",_vehList);

    // Start saving vehicles
    [FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
} else {
    ERROR("Failed to retrieve vehicles list!");
};
