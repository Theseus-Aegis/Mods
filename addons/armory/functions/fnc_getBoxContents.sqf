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

local _box = GVAR(box);
if (isNil "_box") exitWith {ACE_LOGERROR("box is nil")};

local _contents = [];

local _itemCargo = getItemCargo _box;
local _weaponCargo = getWeaponCargo _box;
local _magazineCargo = getMagazineCargo _box;
local _backpackCargo = getBackpackCargo _box;

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
