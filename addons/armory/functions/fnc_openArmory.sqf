/*
 * Author: Jonpas
 * Open Armory on an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, player] call tac_armory_fnc_openArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// Prevent others using the same Armory object
_object setVariable [QGVAR(inUse), true, true];

// Set varaible for later reference
ACE_player setVariable [QGVAR(object), _object, true];

// Create display and load main menu
createDialog QGVAR(Display);
["main"] call FUNC(dialogControl);
