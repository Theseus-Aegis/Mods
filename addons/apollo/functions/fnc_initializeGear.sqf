/*
 * Author: alganthe
 * Removes gear and call extension to load gear next frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_apollo_fnc_initializeGear
 *
 * Public: No
 */
#include "script_component.hpp"

player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
[FUNC(playerLoadClient), [player]] call CBA_fnc_execNextFrame;
