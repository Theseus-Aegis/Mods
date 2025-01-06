#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Returns the classname of a unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Classname <STRING>
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_chestpack;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable [QGVAR(chestpack), nil];

if (isNil "_var") exitWith {""};
private _chestpackClass = (_var select 0) select 0;

// return classname
_chestpackClass
