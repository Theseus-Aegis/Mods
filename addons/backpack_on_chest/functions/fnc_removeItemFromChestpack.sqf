#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Removes item from unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item/magazine/weapon classname <STRING>
 * 2: Quantity (Optional) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"FirstAidKit"] call tac_backpack_on_chest_fnc_removeItemFromChestpack;
 *
 * Public: No
 */
params ["_unit","_item", ["_quantity", 1]];

private _loadout = _unit call FUNC(chestpackLoadout);
private _itemFound = {
    if (_x find _item isNotEqualTo -1) exitWith {
        [_x, _forEachIndex, true]
    };
} forEach _loadout;

// exit if no item found
if (_itemFound select 2 isNotEqualTo true) exitWith {};

private _var = _unit getVariable [QGVAR(chestpack), nil];
private _currentItem = (_var select 2) select (_itemFound select 1);
private _newQuantity = (_currentItem select 1) - _quantity;

if (_newQuantity <= 0) then {
    (_var select 2) deleteAt (_itemFound select 1);
} else {
    private _newItem = +(_currentItem);
    _newItem set [1, _newQuantity];
    (_var select 2) set [(_itemFound select 1), _newItem];
};

_unit setVariable [QGVAR(chestpack), _var, true];

// return deleted item
(_itemFound select 0)
