#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Checks if given item can be stored into soldier's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item/magazine/weapon classname <STRING>
 * 2: Amount <NUMBER> (optional)
 *
 * Return Value:
 * Can add item? <BOOL>
 *
 * Example:
 * [player,"FirstAidKit",2] call tac_backpack_on_chest_fnc_canAddItemToChestpack;
 *
 * Public: No
 */
params ["_unit","_item",["_amount",1]];

private _var = _unit getVariable [QGVAR(chestpack), nil];
private _preLoadPercent = _var select 4;

//calculate space left in chestpack
private _maximumLoad = getNumber(configFile >> "CfgVehicles" >> ([_unit] call FUNC(chestpack)) >> "maximumLoad");
private _remainingLoad = (1 - _preLoadPercent) * _maximumLoad;
private _itemMass = [_item] call FUNC(itemMass);

[true, false] select ((_itemMass * _amount) > _remainingLoad);
