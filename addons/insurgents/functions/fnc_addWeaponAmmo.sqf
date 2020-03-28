#include "script_component.hpp"
/*
 * Author: vetran29
 * Add random compatible ammo to unit weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Primary muzzle ammo count, defaults to 6 <NUMBER>
 * 3: Additional muzzles ammo count, defaults to 3 <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_weapon", ["_primaryAmmo", 6], ["_additionalAmmo", 3]];

private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;
{
    if (_x == "this") then {
        private _primaryMag = selectRandom (_weaponCfg call CBA_fnc_compatibleMagazines);
        _unit addWeaponItem [_weapon, _primaryMag];
        _unit addMagazines [_primaryMag, _primaryAmmo - 1];
    } else {
        private _additionalMag = selectRandom ((_weaponCfg >> _x) call CBA_fnc_compatibleMagazines);
        _unit addWeaponItem [_weapon, _additionalMag];
        _unit addMagazines [_additionalMag, _additionalAmmo];
    };
} forEach getArray (_weaponCfg >> "muzzles");

nil
