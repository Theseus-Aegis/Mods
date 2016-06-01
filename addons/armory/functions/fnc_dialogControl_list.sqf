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
#include "script_component.hpp"

params ["_selectedCategory"];
GVAR(selectedCategory) = _selectedCategory; // For FUNC(dialogControl_takestash)

// Show Dropdown, Amount and List
ctrlSetText [AMOUNT, QPATHTOF(UI\textAmount.paa)];
{
    ctrlShow [_x, true];
} forEach [DROPDOWN, AMOUNT, NLIST];

// Get box contents if selected category is stash, get data from Chronos if enabled or use preset data
private _armoryData = [];
private _exit = false;
if (_selectedCategory == "stash") then {
    _armoryData = call FUNC(getBoxContents);
} else {
    if (GVAR(system) == 0) then {
        _armoryData = [_selectedCategory] call FUNC(getDataVanilla);
    };
    if (GVAR(system) == 1) then {
        _armoryData = [_selectedCategory] call FUNC(getDataChronos);
        if (_armoryData isEqualTo false) exitWith {
            _exit = true;
        };
    };
};

if (_exit) exitWith {};

// Extract sub-categories
private _hasCompatibleItems = _selectedCategory in ["ammo", "attachment"];
private _subCategories = [_armoryData, _hasCompatibleItems] call FUNC(extractSubCategories);

// Fill Dropdown
lbClear DROPDOWN; // Clear Dropdown
{
    lbAdd [DROPDOWN, _x select 0];
    lbSetTooltip [DROPDOWN, _forEachIndex, _x select 1];
} forEach _subCategories;

// Set initial value to 'All' (will not fire onLBSelChanged)
lbSetCurSel [DROPDOWN, 0];

// Fill List
[_armoryData] call FUNC(dialogControl_populateList);
