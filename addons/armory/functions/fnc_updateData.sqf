/*
 * Author: Jonpas
 * Updates Armory Data in currently open screen.
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [data] call tac_armory_fnc_updateData
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_newArmoryData"];

TRACE_1("Armory data update",_newArmoryData);

[_newArmoryData] call FUNC(dialogControl_populateList);
call FUNC(dialogControl_amountSelection);
call FUNC(dialogControl_takestash);
