/*
 * Author: Jonpas
 * Returns contents of a box.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Box Contents <ARRAY>
 *
 * Example:
 * [] call tac_armory_fnc_getBoxContents
 *
 * Public: No
 */
#include "script_component.hpp"

private _object = ACE_player getVariable [QGVAR(object), objNull];

private _contents = [];

private _itemCargo = getItemCargo _object;
private _weaponCargo = getWeaponCargo _object;
private _magazineCargo = getMagazineCargo _object;
private _backpackCargo = getBackpackCargo _object;

_itemCargo params ["_itemClassNames", "_itemQuantity"];
{
    private _quantity = str (_itemQuantity select _forEachIndex);
    _contents pushBack [_x, "Items", "", _quantity];
} forEach _itemClassNames;

_weaponCargo params ["_weaponClassNames", "_weaponQuantity"];
{
    private _quantity = str (_weaponQuantity select _forEachIndex);
    _contents pushBack [_x, "Weapons", "", _quantity];
} forEach _weaponClassNames;

_magazineCargo params ["_magazineClassNames", "_magazineQuantity"];
{
    private _quantity = str (_magazineQuantity select _forEachIndex);
    _contents pushBack [_x, "Ammo", "", _quantity];
} forEach _magazineClassNames;

_backpackCargo params ["_backpackClassNames", "_backpackQuantity"];
{
    private _quantity = str (_backpackQuantity select _forEachIndex);
    _contents pushBack [_x, "Backpacks", "", _quantity];
} forEach _backpackClassNames;

_contents
