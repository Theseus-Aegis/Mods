#include "script_component.hpp"
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
_weapons pushBack (primaryWeapon _unit);
_items append (primaryWeaponItems _unit);
_items append (primaryWeaponMagazine _unit);
_weapons pushBack (secondaryWeapon _unit);
_items append (secondaryWeaponItems _unit);
_items append (secondaryWeaponMagazine _unit);
_weapons pushBack (handgunWeapon _unit);
_items append (handgunItems _unit);
_items append (handgunMagazine _unit);
_weapons append (_unit getVariable [QGVAR(droppedWeapons), []]);
_items append (_unit getVariable [QGVAR(droppedItems), []]);
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

// Weapons with preset attachments and no non-preset parent will get attachments duplicated
{
    private _weaponNonPreset = [_x] call CBA_fnc_getNonPresetClass;
    if (_weaponNonPreset == "") then {
        _weaponNonPreset = _x;
    };
    _bodybag addWeaponCargoGlobal [_weaponNonPreset, 1];
} forEach _weapons;

// Backpacks with items already in them and no non-preset parent (special classes) will get those copied over as well, resulting in duplicated items)
private _backpack = backpack _unit;
if (_backpack != "" && {random 100 > GVAR(destroyChance)}) then {
    private _backpackNonPreset = [_backpack, "CfgVehicles"] call CBA_fnc_getNonPresetClass;
    if (_backpackNonPreset == "") then {
        _backpackNonPreset = _backpack;
    };
    _bodybag addBackpackCargoGlobal [_backpackNonPreset, 1];
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
