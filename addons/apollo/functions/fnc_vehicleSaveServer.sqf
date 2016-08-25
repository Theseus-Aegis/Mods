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

private _vehList = GVAR(vehiclesList); // Make safe copy in case of new vehicles during this save round
private _activePlayers = call CBA_fnc_players; // allPlayers returns headless clients as well

// Save only if there are players connected
if !(_activePlayers isEqualTo []) then {
    {
        [_x] call FUNC(vehicleSingletonSave);
    } forEach _vehList;
    TRACE_3("All Vehicles Saved",count _vehList,_vehList,count _activePlayers);
};

// Save again in 60 seconds
[FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
