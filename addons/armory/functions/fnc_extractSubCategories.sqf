#include "script_component.hpp"
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

params ["_armoryData", "_compatible"];

private _subCategories = [ ["All", ""] ];
if (_compatible) then {
    _subCategories pushBack ["Compatible", localize LSTRING(ShowOnlyCompatible)];
};

private _dataSubCategories = [];
{
    _x params ["", "_subCategory"];

    _dataSubCategories pushBackUnique [_subCategory, ""];
} forEach _armoryData;

_dataSubCategories sort true;

_subCategories append _dataSubCategories;

//TRACE_1("SubCategories",_subCategories);
_subCategories
