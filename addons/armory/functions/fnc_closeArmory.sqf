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
private _object = ACE_player getVariable [QGVAR(object), objNull];
_object setVariable [QGVAR(inUse), nil, true];

ACE_player setVariable [QGVAR(object), nil, true];

// Clean up variables
GVAR(selectedCategory) = nil;
GVAR(armoryData) = nil;
