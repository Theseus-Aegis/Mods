#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds items to the Armory's box or removes them from it, by the item's type (as the Armory does
 * without Chronos). Server only.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Class Name <STRING>
 * 2: Count <NUMBER>
 * 3: Add (true) or remove (false) <BOOL>
 * 4: Magazine Rounds <NUMBER> (default: -1, adding: full, removing: any)
 * 5: Keep Magazines (removing a weapon) <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [box, "30Rnd_65x39_caseless_mag", 2, true, 12] call tac_apollo_fnc_boxCargo
 *
 * Public: No
 */

params ["_box", "_class", "_count", "_add", ["_rounds", -1], ["_keepMagazines", false]];

if (_count <= 0) exitWith {};

private _isBackpack = [_class] call ACEFUNC(backpacks,isBackpack);
private _itemType = ([_class] call ACEFUNC(common,getItemType)) select 0;

if (_add) then {
    switch (true) do {
        case (_isBackpack): {
            _box addBackpackCargoGlobal [_class, _count];
        };
        case (_itemType == "weapon"): {
            _box addWeaponCargoGlobal [_class, _count];
        };
        case (_itemType == "magazine"): {
            if (_rounds < 0) then {
                _box addMagazineCargoGlobal [_class, _count];
            } else {
                _box addMagazineAmmoCargo [_class, _count, _rounds];
            };
        };
        default {
            _box addItemCargoGlobal [_class, _count];
        };
    };
} else {
    switch (true) do {
        case (_isBackpack): {
            [_box, _class, _count, true] call CBA_fnc_removeBackpackCargo;
        };
        case (_itemType == "weapon"): {
            [_box, _class, _count, _keepMagazines] call CBA_fnc_removeWeaponCargo;
        };
        case (_itemType == "magazine"): {
            [_box, _class, _count, _rounds] call CBA_fnc_removeMagazineCargo;
        };
        default {
            [_box, _class, _count, true] call CBA_fnc_removeItemCargo;
        };
    };
};
