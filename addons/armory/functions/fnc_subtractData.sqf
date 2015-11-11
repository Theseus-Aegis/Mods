/*
 * Author: Jonpas
 * Subtracts quantity of an item or removes it completely (for in-list handling).
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *
 * Return Value:
 * Subtracted Armory Data <ARRAY>
 *
 * Example:
 * _armoryDataSubtracted = [[armoryData]] call tac_armory_fnc_subtractData
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_armoryData", "_selectedItem", "_selectedAmount"];

local _armoryDataSubtracted = [];
{
    _x params ["_className", "_subCategory", "_description", "_quantity"];

    if (_selectedItem == _className) then {
        _quantity = (parseNumber _quantity) - (parseNumber _selectedAmount);
        if (_quantity > 0) then {
            _armoryDataSubtracted pushBack [_className, _subCategory, _description, str(_quantity)];
        };
    } else {
        _armoryDataSubtracted pushBack _x;
    };
} forEach _armoryData;

TRACE_2("Armory data subtract",_armoryData,_armoryDataSubtracted);

_armoryDataSubtracted
