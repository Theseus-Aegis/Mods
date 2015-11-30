/*
 * Author: Jonpas
 * Checks if armory can be added to the object (object has inventory).
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

private _config = configFile >> "CfgVehicles" >> typeOf _object;

(getNumber (_config >> "transportMaxBackpacks") > 0) &&
{getNumber (_config >> "transportMaxMagazines") > 0} &&
{getNumber (_config >> "transportMaxWeapons") > 0}
