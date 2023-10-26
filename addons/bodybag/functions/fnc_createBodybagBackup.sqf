#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Create a bodybag filled with items from an array returned by FUNC(getBodybagContents).
 *
 * Arguments:
 * 0: Bodybag Contents <ARRAY>
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

if (_bodybagContents isEqualTo [] || {(count _bodybagContents) isNotEqualTo 4}) exitWith {
    ERROR("Failed to create bodybag! Invalid input.");
};

private _bodyBag = createVehicle ["ACE_bodyBagObject", ace_player];

(_bodybagContents select 0) params ["_itemCargo", "_itemCargoAmount"];
{
    _bodyBag addItemCargoGlobal [_x, (_itemCargoAmount select _forEachIndex)];
} forEach _itemCargo;

(_bodybagContents select 1) params ["_backpackCargo", "_backpackCargoAmount"];
{
    _bodyBag addBackpackCargoGlobal [_x, (_backpackCargoAmount select _forEachIndex)];
} forEach _backpackCargo;

(_bodybagContents select 2) params ["_weaponCargo", "_weaponCargoAmount"];
{
    _bodyBag addWeaponCargoGlobal [_x, (_weaponCargoAmount select _forEachIndex)];
} forEach _weaponCargo;

(_bodybagContents select 3) params ["_magazineCargo", "_magazineCargoAmount"];
{
    _bodyBag addMagazineCargoGlobal [_x, (_magazineCargoAmount select _forEachIndex)];
} forEach _magazineCargo;
