#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Returns the cargo container of a unit's chestpack. Note that this is only a prop and does not contain any items. Items which
 * were added with vanilla commands like 'addWeaponCargo' etc. will be ignored. You have to use the provided functions instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Cargo container or objNull <OBJECT>
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_chestpackContainer;
 *
 * Public: No
 */
params ["_unit"];

if (isNil "_unit") exitWith {
    ERROR("No proper argument(s) given.");
};

private _var = _unit getVariable [QGVAR(chestpack), nil];
private _chestpack = (_var select 0) select 1;

if (isNil "_var" || isNil "_chestpack") exitWith {objNull};

_chestpack
