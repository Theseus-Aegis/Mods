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

_items pushBack (headgear _unit);
_items pushBack (goggles _unit);
_items pushBack (uniform _unit);
_items append (uniformItems _unit);
_items pushBack (vest _unit);
_items append (vestItems _unit);
_items append (backpackItems _unit);
_weapons append (_unit getVariable [QGVAR(droppedWeapons), []]);
_weapons pushBack (handgunWeapon _unit);
_items append (handgunItems _unit);
_items append (handgunMagazine _unit);
_items append (assignedItems _unit);
//_weapons pushBack (binocular _unit); // dropped into inventory on death
_items pushBack (_unit call CBA_fnc_binocularMagazine);

// Clear empty names and destroy items with a random chance
_items = _items select {_x != "" && {random 100 > GVAR(destroyChance)} };
_weapons = _weapons select {_x != "" && {random 100 > GVAR(destroyChance)} };

TRACE_2("Body Inventory",_items,_weapons);

{
    _bodybag addItemCargoGlobal [_x, 1];
} forEach _items;
{
    _bodybag addWeaponCargoGlobal [_x, 1];
} forEach _weapons;

// Backpacks with items already in them (special classes) will get those copied over as well, resulting in duplicated items)
private _backpack = backpack _unit;
if (_backpack != "" && {random 100 > GVAR(destroyChance)}) then {
    _bodybag addBackpackCargoGlobal [_backpack, 1];
};

// Remove possible left-over ground weapon holder
private _nearHolders = nearestObjects [_bodybag, ["WeaponHolderSimulated"], 3];
TRACE_1("Near Holders",_nearHolders);
{
    private _holderWeapons = ((getWeaponCargo _x) select 0) select {_x in _weapons};
    if !(_holderWeapons isEqualTo []) exitWith {
        deleteVehicle _x;
    };
} forEach _nearHolders;
