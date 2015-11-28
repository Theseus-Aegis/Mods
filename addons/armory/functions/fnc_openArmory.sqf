/*
 * Author: Jonpas
 * Open Armory on an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_armory_fnc_openArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_player"];

// Prevent others using the same Armory object
_object setVariable [QGVAR(inUse), true, true];

// Set varaible for later reference
_player setVariable [QGVAR(object), _object, true];

// Create display and load main menu
createDialog QGVAR(Display);
["main"] call FUNC(dialogControl);
