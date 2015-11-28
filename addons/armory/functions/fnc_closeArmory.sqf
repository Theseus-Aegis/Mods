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

// Close Armory dialog
closeDialog 0;

// Clean up variables
GVAR(box) = nil;
GVAR(selectedCategory) = nil;
GVAR(armoryData) = nil;

// Allow others to use the object's Armory
_object = GVAR(box);
_object setVariable [QGVAR(notInUse), true];
