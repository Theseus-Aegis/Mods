/*
 * Author: Jonpas
 * Puts killed unit's inventory into the body bag.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 * 1: Body Bag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [killed, bodybag] call tac_bodybag_fnc_moveInventory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_bodybag"];

private _items = [];
private _weapons = [];
private _magazines = [];

_items pushBack (headgear _unit);
_items pushBack (goggles _unit);
_items pushBack (uniform _unit);
_items append (uniformItems _unit);
_items pushBack (vest _unit);
_items append (vestItems _unit);
_items append (backpackItems _unit);
_weapons pushBack (handgunWeapon _unit);
_items append (handgunItems _unit);
_magazines append (handgunMagazine _unit);
_items append (assignedItems _unit);
_weapons pushBack (binocular _unit);
_magazines pushBack ([_unit] call CBA_fnc_binocularMagazine);

_items = _items select {_x != ""};
_weapons = _weapons select {_x != ""};
_magazines = _magazines select {_x != ""};

TRACE_3("Body Inventory",_items,_weapons,_magazines);

{
    _bodybag addItemCargoGlobal [_x, 1];
} forEach _items;
{
    _bodybag addWeaponCargoGlobal [_x, 1];
} forEach _weapons;
{
    _bodybag addMagazineCargoGlobal [_x, 1];
} forEach _magazines;

_bodybag addBackpackCargoGlobal [backpack _unit, 1];
