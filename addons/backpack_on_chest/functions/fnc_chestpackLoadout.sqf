#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Returns Unit Loadout Array of chestpack of the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_chestpackLoadout;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable [QGVAR(chestpack), nil];
private _loadout = + (_var select 2);

// return objNull
if (isNil "_var" || isNil "_loadout") exitWith {[]};

// return items
_loadout
