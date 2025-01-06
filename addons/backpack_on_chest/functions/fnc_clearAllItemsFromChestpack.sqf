#include "..\script_component.hpp"
/*
 * Author: DerZade
 * Removes all items (includes weapons and magazines) from a unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Clear Variables (Optional) <BOOLEAN>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call zade_boc_fnc_clearAllItemsFromChestpack;
 *
 * Public: No
 */
params ["_unit", ["_variables", true]];

private _var = _unit getVariable [QGVAR(chestpack),nil];
_var set [2,[]];

if (_variables) then {
    _var set [3, []];
};

_var set [4, 0];

_unit setVariable [QGVAR(chestpack),_var, true];
