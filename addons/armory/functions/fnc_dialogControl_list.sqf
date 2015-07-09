/*
 * Author: Jonpas
 * Sets up requested list and dropdown.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["category"] call tac_armory_fnc_dialogControl_list
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_selectedCategory);
GVAR(selectedCategory) = _selectedCategory;

private ["_armoryData", "_subCategories"];

// Show Dropdown, Amount and List
ctrlSetText [AMOUNT, QUOTE(PATHTOF(UI\textAmount.paa))];
{
    ctrlShow [_x, true];
} forEach [DROPDOWN, AMOUNT, NLIST];


// Get Data to fill
_armoryData = [_selectedCategory] call FUNC(getDataCallback);
_subCategories = [_armoryData] call FUNC(extractSubCategories);


// Fill Dropdown
lbClear DROPDOWN; // Clear Dropdown
{
    lbAdd [DROPDOWN, _x];
} forEach _subCategories;

// Fill List
[_armoryData] call FUNC(dialogControl_populateList);
