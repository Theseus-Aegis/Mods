#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Creates a new item and stores it in the soldier's chestpack.
 * The item(s) won't be added, if adding them would cause an overflow of the backpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"FirstAidKit"] call tac_backpack_on_chest_fnc_addItemToChestpack;
 *
 * Public: No
 */
params ["_unit","_item"];

private _var = _unit getVariable [QGVAR(chestpack), nil];

// exit if there is not enough space left
if !([_unit, _item] call FUNC(canAddItemToChestpack)) exitWith {};

// add item
private _itemMass = [_item] call FUNC(itemMass);
private _maximumLoad = getNumber(configFile >> "CfgVehicles" >> ([_unit] call FUNC(chestpack)) >> "maximumLoad");
private _preLoadPercent = _var select 4;
(_var select 2) pushBack [_item, 1];
_var set [4, (_preLoadPercent + (_itemMass / _maximumLoad))];

// update public variable
_unit setVariable [QGVAR(chestpack), _var, true];
