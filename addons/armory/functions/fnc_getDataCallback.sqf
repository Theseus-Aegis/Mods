/*
 * Author: Jonpas
 * Gets box contents or data based on selected option.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * Armory Data <ARRAY>
 *
 * Example:
 * ["category"] call tac_armory_fnc_getDataCallback
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_selectedCategory);

private ["_armoryData"];

_armoryData = [];
if (_selectedCategory == "stash") then {
    _armoryData = call FUNC(getBoxContents);
} else {
    _armoryData = [_selectedCategory] call FUNC(getData);
};

_armoryData
