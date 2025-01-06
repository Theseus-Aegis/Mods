#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Returns array with all variables in chestpack of the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * variables <ARRAY>
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_chestpackVariables;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable [QGVAR(chestpack), nil];
private _variables = + (_var select 3);


if (isNil "_var" || isNil "_variables") exitWith {[]};

// return items
_variables
