/*
 * Author: Jonpas
 * Gets box contents or data based on selected option.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Armory Data <ARRAY>
 *
 * Example:
 * call tac_armory_fnc_getDataCallback
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_armoryData"];

_armoryData = [];
if (GVAR(selectedCategory) == "stash") then {
    _armoryData = call FUNC(getBoxContents);
} else {
    _armoryData = [GVAR(selectedCategory)] call FUNC(getData);
};

_armoryData
