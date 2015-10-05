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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_selectedCategory"];
GVAR(selectedCategory) = _selectedCategory; // For FUNC(dialogControl_takestash)

// Show Dropdown, Amount and List
ctrlSetText [AMOUNT, QUOTE(PATHTOF(UI\textAmount.paa))];
{
    ctrlShow [_x, true];
} forEach [DROPDOWN, AMOUNT, NLIST];

// Get box contents if selected category is stash, get data from Chronos if enabled or use preset data
local _armoryData = [];
local _chronosError = false;
if (_selectedCategory == "stash") then {
    _armoryData = call FUNC(getBoxContents);
} else {
    if ((!isNil "ChronosLoaded" && {ChronosLoaded == "true"}) || {CHRONOS_DEBUG}) then {
        _armoryData = [_selectedCategory] call FUNC(getDataChronos);
        if (_armoryData isEqualTo false) exitWith {_chronosError = true};
    } else {
        _armoryData = [_selectedCategory] call FUNC(getData);
    };
};

if (_chronosError) exitWith {diag_log "[ERROR] Armory: Athena server is down"};

// Extract sub-categories
local _subCategories = [_armoryData] call FUNC(extractSubCategories);

// Fill Dropdown
lbClear DROPDOWN; // Clear Dropdown
{
    lbAdd [DROPDOWN, _x];
} forEach _subCategories;

// Fill List
[_armoryData] call FUNC(dialogControl_populateList);
