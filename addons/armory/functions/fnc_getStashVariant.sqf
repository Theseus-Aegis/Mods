#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Gets what stashing an item from the box puts into the locker: the base variant of a scripted
 * optic, accessory or disposable launcher (CBA), and whether a weapon's magazines stay in the box
 * (not for a disposable launcher's).
 *
 * Arguments:
 * 0: Item Class Name in the box <STRING>
 *
 * Return Value:
 * [Item Class Name for the locker <STRING>, Keep Magazines <BOOL>]
 *
 * Example:
 * ["launch_NLAW_F"] call tac_armory_fnc_getStashVariant
 *
 * Public: No
 */

params ["_itemBox"];

private _item = _itemBox;
private _keepMagazines = true;
if (getNumber (configFile >> "CfgWeapons" >> _itemBox >> "scope") != 2) then {
    _item = [_itemBox] call FUNC(getBaseVariant);

    // Clear disposable launcher magazine (passed to CBA_fnc_removeWeaponCargo)
    if (isArray (configFile >> "CBA_DisposableLaunchers" >> _itemBox) || {isArray (configFile >> "CBA_DisposableLaunchers" >> _item)}) then {
        _keepMagazines = false;
    };
};

[_item, _keepMagazines]
