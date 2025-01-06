#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Creates new magazine and stores it in  the soldier's chestpack. Only magazines are supported.
 * The purpose of this function is to ensure that magazines with a specified ammo count can be added.
 * If you want to add a/multiple full magazine(s) you may want to use 'zade_boc_addItemToChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Ammo count <NUMBER>
 * 3: Quanitity (Optional) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"30Rnd_556x45_Stanag",25] call zade_boc_fnc_addMagToChestpack;
 *
 * Public: No
 */
params ["_unit","_item","_ammo", ["_quantity", 1]];

// exit if there is not enough space left
if !([_unit, _item, _quantity] call FUNC(canAddItemToChestpack)) exitWith {};

private _var = _unit getVariable [QGVAR(chestpack), nil];

(_var select 2) pushBack [_item, _quantity, _ammo];

// update variable
_unit setVariable [QGVAR(chestpack), _var, true];
