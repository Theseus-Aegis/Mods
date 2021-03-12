#include "script_component.hpp"
/*
 * Author: JoramD
 * Create a bodybag filled with items from an array made by tac_bodybag_fnc_getBodybagContents.
 *
 * Arguments:
 * 0: bodybagContents <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [arrayOfStuff] call tac_bodybag_fnc_createBodybagBackup
 *
 * Public: Yes
 */

params ["_bodybagContents"];

private _bodyBag = createVehicle ["ACE_bodyBagObject", ace_player];

private _items = _bodybagContents select 0;
private _itemCargo = _items select 0;
private _itemCargoAmount = _items select 1;
{
    _bodyBag addItemCargoGlobal [_x, (_itemCargoAmount select _forEachIndex)];
} forEach _itemCargo;

private _backpacks = _bodybagContents select 1;
private _backpackCargo = _backpacks select 0;
private _backpackCargoAmount = _backpacks select 1;
{
    _bodyBag addBackpackCargoGlobal [_x, (_backpackCargoAmount select _forEachIndex)];
} forEach _backpackCargo;

private _weapons = _bodybagContents select 2;
private _weaponCargo = _weapons select 0;
private _weaponCargoAmount = _weapons select 1;
{
    _bodyBag addWeaponCargoGlobal [_x, (_weaponCargoAmount select _forEachIndex)];
} forEach _weaponCargo;

private _magazines = _bodybagContents select 3;
private _magazineCargo = _magazines select 0;
private _magazineCargoAmount = _magazines select 1;
{
    _bodyBag addMagazineCargoGlobal [_x, (_magazineCargoAmount select _forEachIndex)];
} forEach _magazineCargo;
