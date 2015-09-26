/*
 * Author: Jonpas
 * Sets up sub-categories and calls list population.
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [armoryData] call tac_armory_fnc_dialogControl_list2
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_armoryData"];
private ["_subCategories"];

_subCategories = [_armoryData] call FUNC(extractSubCategories);

// Fill Dropdown
lbClear DROPDOWN; // Clear Dropdown
{
    lbAdd [DROPDOWN, _x];
} forEach _subCategories;

// Make global for sub-category selection
GVAR(armoryData) = _armoryData;

// Fill List
[_armoryData] call FUNC(dialogControl_populateList);
