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
    // Exit if not all loaded yet
    if (["isVehiclesAllLoaded"] call FUNC(invokeJavaMethod) != "true") exitWith {};

    [_this select 1] call CBA_fnc_removePerFrameHandler;

    // Allow damage on all vehicles
    private _savedVehicles = 0;
    {
        private _vehicleID = _x getVariable [QGVAR(vehicleID), "None"];
        if (_vehicleID select [0, 3] == "TAC") then {
            _x allowDamage true;
            _savedVehicles = _savedVehicles + 1;
       };
    } forEach vehicles;

    // Set vehicles loaded flag
    GVAR(vehiclesLoaded) = true;
    publicVariable QGVAR(vehiclesLoaded);

    ACE_LOGINFO_1("%1 vehicle(s) loaded.",_savedVehicles);

    // Start saving vehicles
    [FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
}, 5, []] call CBA_fnc_addPerFrameHandler;
