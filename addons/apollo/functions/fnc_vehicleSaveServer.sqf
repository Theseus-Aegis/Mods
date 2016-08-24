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
#include "script_component.hpp"

private _activePlayers = call CBA_fnc_players; // allPlayers returns headless clients as well

// Save only if there are players connected
if !(_activePlayers isEqualTo []) then {
    private _savedVehicles = 0;
    {
        private _vehicleID = _x getVariable [QGVAR(vehicleID), "None"];
        if (_vehicleID select [0, 3] == "TAC") then {
            [_x, _vehicleID] call FUNC(vehicleSingletonSave);

            TRACE_1("Saving Vehicle",_vehicleID);
            _savedVehicles = _savedVehicles + 1;
        };
    } forEach vehicles;
    TRACE_2("All Vehicles Saved",_savedVehicles,count _activePlayers);
};

// Save again in 60 seconds
[FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
