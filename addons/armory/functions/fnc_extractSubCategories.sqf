/*
 * Author: Jonpas
 * Extracts sub-categories from Armory Data.
 *
 * Arguments:
 * 0: Requested Menu <STRING>
 * 1: Compatible Category <BOOL>
 *
 * Return Value:
 * Sub-Categories <ARRAY>
 *
 * Example:
 * ["menu", true] call tac_armory_fnc_extractSubCategories
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_armoryData", "_compatible"];

private _dataSubCategories = [];
{
    _x params ["", "_subCategory"];

    _dataSubCategories pushBackUnique _subCategory;
} forEach _armoryData;

_dataSubCategories sort true;

private _subCategories = [["All"], ["All", "Compatible"]] select _compatible;
_subCategories append _dataSubCategories;

_subCategories
