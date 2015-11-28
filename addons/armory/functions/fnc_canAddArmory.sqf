/*
 * Author: Jonpas
 * Checks if armory can be added to the object (object has inventory and is not in use).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Add Armory <BOOL>
 *
 * Example:
 * [object] call tac_armory_fnc_canAddArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

local _config = configFile >> "CfgVehicles" >> typeOf _object;

(_object getVariable [QGVAR(notInUse), true]) &&
{(getNumber (_config >> "transportMaxBackpacks") > 0} &&
{getNumber (_config >> "transportMaxMagazines") > 0} &&
{getNumber (_config >> "transportMaxWeapons") > 0}
