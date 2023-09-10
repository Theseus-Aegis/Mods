#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Saves vehicles.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_apollo_fnc_vehicleSaveServer
 *
 * Public: No
 */

// Make safe copy in case of new vehicles during this save round
private _vehList = +GVAR(vehiclesList);

{
    [_x] call FUNC(vehicleSingletonSave);
} forEach _vehList;

TRACE_2("Vehicles Saved",count _vehList,_vehList);

// Save again in 60 seconds
[FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
