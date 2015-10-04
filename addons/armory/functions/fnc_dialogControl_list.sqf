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

private ["_armoryData"];

// Show Dropdown, Amount and List
ctrlSetText [AMOUNT, QUOTE(PATHTOF(UI\textAmount.paa))];
{
    ctrlShow [_x, true];
} forEach [DROPDOWN, AMOUNT, NLIST];

// Get box contents if selected category is stash
if (_selectedCategory == "stash") exitWith {
    _armoryData = call FUNC(getBoxContents);
    [_armoryData] call FUNC(dialogControl_list2);
};

ChronosLoaded = "true";//debug Chronos
// Get Data to fill from Chronos if available
if (!isNil "ChronosLoaded" && {ChronosLoaded == "true"}) then {
    _armoryData = [_selectedCategory] call FUNC(getDataChronos);
    if (_armoryData isEqualTo false) exitWith {diag_log "[ERROR] Armory: Athena server is down"};
    [_armoryData] call FUNC(dialogControl_list2);
} else {
    // Get preset data
    _armoryData = [_selectedCategory] call FUNC(getData);
    [_armoryData] call FUNC(dialogControl_list2);
};
