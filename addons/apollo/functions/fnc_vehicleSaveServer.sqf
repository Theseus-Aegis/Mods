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

// Vehicles that are gone (deleted, a static weapon packed up, a wreck cleaned up) are removed from
// Chronos here rather than as they go: nothing is removed when the mission ends, as this stops then
private _removed = [];
{
    if (isNull _y) then {
        _removed pushBack _x;
    } else {
        // Loaded as ACE cargo: saved with the vehicle carrying it
        private _carrier = attachedTo _y;
        if (isNull _carrier || {!(_y in (_carrier getVariable [QACEGVAR(cargo,loaded), []]))}) then {
            [_y] call FUNC(vehicleSingletonSave);
        };
    };
} forEach GVAR(vehicles);

{
    GVAR(vehicles) deleteAt _x;
    ["removeVehicle", _x] call FUNC(callServerExt);
    INFO_1("Vehicle %1 is gone, removed",_x);
} forEach _removed;

TRACE_2("Vehicles saved",count GVAR(vehicles),_removed);

// Save again in 60 seconds
[FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
