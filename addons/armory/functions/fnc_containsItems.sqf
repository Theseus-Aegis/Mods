/*
 * Author: Jonpas
 * Checks if weapon to be stashed has attachments or magazines and uniform/vest/backpack has contents.
 *
 * Arguments:
 * 0: Item Classname <STRING>
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

params ["_itemClass"];

private _itemType = [_itemClass] call ACE_Common_fnc_getItemType;
private _return = false;

// Weapons with Attachments or Magazines
if (_itemType select 0 == "weapon") then {
    {
        if (_x select 0 == _itemClass) then {
            _x deleteAt 0; // Errors when combined with forEach
            {
                if !(_x in ["", []]) exitWith {
                    hintSilent localize LSTRING(Notification_ContainsItemsWeapon);
                    _return = true;
                };
            } forEach _x;
        };
    } forEach (weaponsItemsCargo _object);
};

// Uniforms/Vests/Backpacks with contents
if (_itemType isEqualTo ["item", "uniform"] || {_itemType isEqualTo ["item", "vest"]} || {[_itemClass] call ACE_Backpacks_fnc_isBackpack}) then {
    {
        _x params ["_containerClass", "_container"];
        if (_containerClass == _itemClass) then {
            if (!((itemCargo _container) isEqualTo []) ||
                {!((weaponCargo _container) isEqualTo [])} ||
                {!((magazineCargo _container) isEqualTo [])} ||
                {!((backpackCargo _container) isEqualTo [])}) exitWith {
                    hintSilent localize LSTRING(Notification_ContainsItemsContainer);
                    _return = true;
            };
        };
    } forEach (everyContainer _object);
};

_return
