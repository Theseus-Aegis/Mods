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

private ["_armoryData", "_openTime"];

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
if (!isNil "ChronosLoaded" && {ChronosLoaded == "true"}) exitWith {
    // Request data from Chronos
    [_selectedCategory] call FUNC(getDataChronos);

    // Add Chronos Public EH
    "armoryData" addPublicVariableEventHandler {
        (_this select 1) params ["", "_armoryData"];
        [_armoryData] call FUNC(dialogControl_list2);
        GVAR(chronosReplied) = true;
    };

    // Start PFH wait until Chronos replies (for user-friendlines)
    _openTime = time;
    [{
        params ["_args", "_pfhID"];
        _args params ["_openTime"];

        // Wait for Chronos reply or 15 seconds timeout
        if (!GVAR(chronosReplied) && {time > _openTime + 15}) exitWith {}; //@todo - add cancel button and make it all fancy

        hintSilent "";
        GVAR(chronosReplied) = false;
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    }, 0, [_openTime]] call CBA_fnc_addPerFrameHandler;
};

// Get preset data
if (_selectedCategory == "stash") then {
    _armoryData = call FUNC(getBoxContents);
} else {
    _armoryData = [_selectedCategory] call FUNC(getData);
};
[_armoryData] call FUNC(dialogControl_list2);
