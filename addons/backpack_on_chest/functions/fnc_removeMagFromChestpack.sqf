#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Removes magazine from unit's chestpack. The purpose of this function is to ensure that magazines with a specified ammo count can be removed.
 * If you want to remove a magazine with just any amount of ammo you may want to use 'zade_boc_fnc_removeItemFromChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Ammo count <NUMBER>
 * 3: Quantity (Optional) <NUMBER>
 *
 * Return Value:
 * [MagazineClassname, Qty, Rounds] <ARRAY>
 *
 * Example:
 * [player,"30Rnd_556x45_Stanag",25] call tac_backpack_on_chest_fnc_removeMagFromChestpack;
 *
 * Public: No
 */
params ["_unit","_item","_ammo", ["_quantity", 1]];

private _loadout = [_unit] call FUNC(chestpackLoadout);

private _mag = {
    if ((_x select 0 isEqualTo _item) && (_x select 2 isEqualTo _ammo)) exitWith {
        [_x, _forEachIndex, true];
    };
} forEach _loadout;

// exit if there is no such item in chestpack
if (_mag select 2 isNotEqualTo true) exitWith {};

private _var = _unit getVariable [QGVAR(chestpack),nil];
private _currentMag = (_var select 2) select (_mag select 1);
private _newQuantity = (_currentMag select 1) - (_quantity);

if (_newQuantity <= 0) then {
    (_var select 2) deleteAt (_mag select 1);
} else {
    private _newMag = [(_currentMag select 0), _newQuantity, (_currentMag select 2)];
    (_var select 2) set [(_mag select 1), _newMag];
};

// update variable
_unit setVariable [QGVAR(chestpack),_var,true];

// return item.
(_mag select 0);
