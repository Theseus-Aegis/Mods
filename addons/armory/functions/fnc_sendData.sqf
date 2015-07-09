/*
 * Author: Jonpas
 * Sends data back to Apollo (Chronos).
 *
 * Arguments:
 * 0: Take/Stash <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["type"] call tac_armory_fnc_sendData
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_type);

// Change to ACE Events (in Apollo as well)
armoryData = [_type, player, GVAR(box), GVAR(selectedItem)];
publicVariableServer "armoryData";
