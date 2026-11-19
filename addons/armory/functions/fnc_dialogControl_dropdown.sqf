#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Dropdown changed: the kit to show (Kits), or the sub-category to list.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_dialogControl_dropdown
 *
 * Public: No
 */

if (GVAR(selectedCategory) == "kits") exitWith {
    call FUNC(dialogControl_kitItems);
};

[GVAR(armoryData)] call FUNC(dialogControl_populateList);
