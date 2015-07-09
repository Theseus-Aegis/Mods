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

private ["_itemCargo", "_weaponCargo", "_magazineCargo", "_backpackCargo", "_itemClassNames", "_itemQuantity", "_className", "_quantity", "_contents", "_weaponClassNames", "_weaponQuantity", "_magazineClassNames", "_magazineQuantity", "_backpackClassNames", "_backpackQuantity"];

if (isNil QGVAR(box)) exitWith {diag_log "[TAC] ERROR: ObjectInteractingWith isNil";};

_contents = [];

_itemCargo = getItemCargo GVAR(box);
_weaponCargo = getWeaponCargo GVAR(box);
_magazineCargo = getMagazineCargo GVAR(box);
_backpackCargo = getBackpackCargo GVAR(box);

_itemClassNames = _itemCargo select 0;
_itemQuantity = _itemCargo select 1;
{
    _className = _x;
    _quantity = str(_itemQuantity select _forEachIndex);

    _contents pushBack [_className, "Items", "", _quantity];
} forEach _itemClassNames;

_weaponClassNames = _weaponCargo select 0;
_weaponQuantity = _weaponCargo select 1;
{
    _className = _x;
    _quantity = str(_weaponQuantity select _forEachIndex);

    _contents pushBack [_className, "Weapons", "", _quantity];
} forEach _weaponClassNames;

_magazineClassNames = _magazineCargo select 0;
_magazineQuantity = _magazineCargo select 1;
{
    _className = _x;
    _quantity = str(_magazineQuantity select _forEachIndex);

    _contents pushBack [_className, "Ammo", "", _quantity];
} forEach _magazineClassNames;

_backpackClassNames = _backpackCargo select 0;
_backpackQuantity = _backpackCargo select 1;
{
    _className = _x;
    _quantity = str(_backpackQuantity select _forEachIndex);

    _contents pushBack [_className, "Backpacks", "", _quantity];
} forEach _backpackClassNames;

_contents
