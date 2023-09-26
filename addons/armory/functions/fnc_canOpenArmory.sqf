#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Checks if armory can be opened (is not in use by someone else).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Open Armory <BOOL>
 *
 * Example:
 * [object] call tac_armory_fnc_canOpenArmory
 *
 * Public: No
 */

params ["_object"];

isNil {_object getVariable QGVAR(inUse)}
