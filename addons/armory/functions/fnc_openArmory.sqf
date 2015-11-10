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
 * [object] call tac_armory_fnc_openArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

GVAR(box) = _object; // Set global variable for later reference

// Create display and load main menu
createDialog QGVAR(Display);
["main"] call FUNC(dialogControl);
