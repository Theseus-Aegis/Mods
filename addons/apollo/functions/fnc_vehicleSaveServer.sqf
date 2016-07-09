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

private _activePlayers = allPlayers - entities "HeadlessClient_F"; // allPlayers returns headless clients as well

// Save only if there are players connected
if !(_activePlayers isEqualTo []) then {
    {
        [_x] call FUNC(vehicleSingletonSave);
    } forEach vehicles;
};

// Save again in 60 seconds
[FUNC(vehicleSaveServer), [], 60] call CBA_fnc_waitAndExecute;
