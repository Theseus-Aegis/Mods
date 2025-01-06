#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton, MikeMF
 * Finds mass of given item.
 *
 * Arguments:
 * 0: Item  <STRING>
 *
 * Return Value:
 * Item mass <NUMBER>
 *
 * Example:
 * ["FirstAidKit"] call tac_backpack_on_chest_fnc_itemMass;
 *
 * Public: No
 */

params ["_item"];

private _weaponConfig = configFile >> "CfgWeapons" >> _item;
private _weaponConfigItemInfo = _weaponConfig >> "ItemInfo";

if (isClass (_weaponConfigItemInfo)) exitWith {
     getNumber (_weaponConfig >> "ItemInfo" >> "Mass");
};

private _weaponConfigSlots = _weaponConfig >> "WeaponSlotsInfo";

if (isClass (_weaponConfigSlots)) exitWith {
     getNumber (_weaponConfigSlots >> "Mass");
};

private _magazineConfigMass = configFile >> "CfgMagazines" >> _item;

if (isClass _magazineConfigMass) exitWith {
     getNumber (_magazineConfigMass >> "Mass");
};

private _vehiclesConfigMass = configFile >>"CfgVehicles">> _item;

if (isClass _vehiclesConfigMass) exitWith  {
     getNumber (_vehiclesConfigMass >> "Mass");
};

private _glassesConfigMass = configFile >> "CfgGlasses" >> _item;

if (isClass _glassesConfigMass) exitWith  {
     getNumber (_glassesConfigMass >> "Mass");
};
