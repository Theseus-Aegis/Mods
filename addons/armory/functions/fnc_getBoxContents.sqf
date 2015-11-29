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
 * ["menu"] call tac_armory_fnc_getBoxContents
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_contents", "_itemCargo", "_weaponCargo", "_magazineCargo", "_backpackCargo"];

local _object = ACE_player getVariable [QGVAR(object), objNull];

_contents = [];

_itemCargo = getItemCargo _object;
_weaponCargo = getWeaponCargo _object;
_magazineCargo = getMagazineCargo _object;
_backpackCargo = getBackpackCargo _object;

_itemCargo params ["_itemClassNames", "_itemQuantity"];
{
    _quantity = str(_itemQuantity select _forEachIndex);
    _contents pushBack [_x, "Items", "", _quantity];
} forEach _itemClassNames;

_weaponCargo params ["_weaponClassNames", "_weaponQuantity"];
{
    _quantity = str(_weaponQuantity select _forEachIndex);
    _contents pushBack [_x, "Weapons", "", _quantity];
} forEach _weaponClassNames;

_magazineCargo params ["_magazineClassNames", "_magazineQuantity"];
{
    _quantity = str(_magazineQuantity select _forEachIndex);
    _contents pushBack [_x, "Ammo", "", _quantity];
} forEach _magazineClassNames;

_backpackCargo params ["_backpackClassNames", "_backpackQuantity"];
{
    _quantity = str(_backpackQuantity select _forEachIndex);
    _contents pushBack [_x, "Backpacks", "", _quantity];
} forEach _backpackClassNames;

_contents
