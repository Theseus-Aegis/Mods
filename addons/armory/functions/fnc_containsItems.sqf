/*
 * Author: Jonpas
 * Checks if weapon to be stashed has attachments or magazines and uniform/vest/backpack has contents.
 *
 * Arguments:
 * 0: Armory Box <OBJECT>
 * 1: Item Classname <STRING>
 *
 * Return Value:
 * Contains Items <BOOL>
 *
 * Example:
 * ["itemClass"] call tac_armory_fnc_containsItems
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_itemClass"];

private _itemType = [_itemClass] call ACEFUNC(common,getItemType);
private _return = false;

// Weapons with Attachments or Magazines
if (_itemType select 0 == "weapon") exitWith {
    {
        _x deleteAt 0; // Errors when combined with forEach
        {
            if !(_x in ["", []]) exitWith {
                [LSTRING(ContainsItemsWeapon), 2.5] call ACEFUNC(common,displayTextStructured);
                _return = true;
            };
        } forEach _x;

        if (_return) exitWith {_return};
    } forEach (weaponsItemsCargo _object);

    _return
};

// Uniforms/Vests/Backpacks with contents
if (_itemType select 0 == "item" || {[_itemClass] call ACEFUNC(backpacks,isBackpack)}) exitWith {
    {
        _x params ["_containerClass", "_container"];
        if (!((itemCargo _container) isEqualTo []) ||
            {!((weaponCargo _container) isEqualTo [])} ||
            {!((magazineCargo _container) isEqualTo [])} ||
            {!((backpackCargo _container) isEqualTo [])}
        ) exitWith {
                [LSTRING(ContainsItemsContainer), 2.5] call ACEFUNC(common,displayTextStructured);
                _return = true;
        };

        if (_return) exitWith {_return};
    } forEach (everyContainer _object);

    _return
};

_return
