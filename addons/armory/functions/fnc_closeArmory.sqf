/*
 * Author: Jonpas
 * Close Armory and clean up.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_armory_fnc_closeArmory
 *
 * Public: No
 */
#include "script_component.hpp"

// Allow others to use the object's Armory
GVAR(box) setVariable [QGVAR(inUse), nil];

// Clean up variables
GVAR(box) = nil;
GVAR(selectedCategory) = nil;
GVAR(armoryData) = nil;
