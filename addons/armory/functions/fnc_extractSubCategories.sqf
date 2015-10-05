/*
 * Author: Jonpas
 * Extracts sub-categories from Armory Data.
 *
 * Arguments:
 * 0: Requested Menu <STRING>
 *
 * Return Value:
 * Sub-Categories <ARRAY>
 *
 * Example:
 * ["menu"] call tac_armory_fnc_extractSubCategories
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_armoryData"];

local _subCategories = ["All"];
{
    local _subCategory = _x select 1;

    if !(_subCategory in _subCategories) then {
        _subCategories pushBack _subCategory;
    };
} forEach _armoryData;

_subCategories sort true;

_subCategories
