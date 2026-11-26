#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns what's kept across missions out of the loadout, as [name, value] pairs for the website.
 * Run where the unit is local (safety and zeroing are only known there).
 * - insignia: the insignia class ("" none)
 * - earplugs: in the ears (ACE Hearing)
 * - gunbag_weapon: the weapon in an ACE gunbag ([weapon, [attachments], [[magazine, rounds], ...]] or [])
 * - zeroing: per equipped weapon [weapon, optic, [[muzzle, muzzle name, distance, step], ...], ACE scopes zero reference]
 *   (each muzzle's zeroing; the ACE dials, elevation and windage, are kept for the mission only: FUNC(getScopeDials))
 * - safety: [[weapon, muzzle], ...] on safe (ACE safe mode)
 * - base_items: [[class, base], ...] for items in the loadout in another state (tac_armory_fnc_getBaseVariant);
 *   Minotaur doesn't keep it for the player, it only learns which item each class is
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Variables <ARRAY>
 *
 * Example:
 * [player] call tac_apollo_fnc_getVariables
 *
 * Public: No
 */

params ["_unit"];

// ACE keeps earplugs and the gunbag's weapon in CBA's extended loadout
private _extended = (_unit call CBA_fnc_getLoadout) param [1, createHashMap];
if !(_extended isEqualType createHashMap) then { _extended = createHashMap; };

private _weapons = [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];
private _adjustments = _unit getVariable [QACEGVAR(scopes,adjustment), []];

private _zeroing = [];
{
    if (_x != "") then {
        private _weapon = _x;
        private _optic = (_unit weaponAccessories _weapon) param [2, ""];
        private _zero = (_adjustments param [_forEachIndex, []]) param [2, 0];
        if !(_zero isEqualType 0) then { _zero = 0; };

        // Every muzzle (the main one is the weapon's own class); a muzzle's name for the website ("" for the main one)
        private _muzzles = [];
        {
            // [distance, step]; step -1 is a laser rangefinder's distance, which isn't kept
            (_unit currentZeroing [_weapon, _x]) params [["_distance", 0], ["_step", -1]];
            if (_step >= 0 && {_distance > 0}) then {
                private _name = ["", getText (configFile >> "CfgWeapons" >> _weapon >> _x >> "displayName")] select (_x != _weapon);
                _muzzles pushBack [_x, _name, _distance, _step];
            };
        } forEach (_weapon call ACEFUNC(common,getWeaponMuzzles));

        if (_muzzles isNotEqualTo [] || {_zero != 0}) then {
            _zeroing pushBack [_weapon, _optic, _muzzles, _zero];
        };
    };
} forEach _weapons;

// A hashmap of weapon -> muzzles (a hashmap or an array) in current ACE, an array of weapons before
private _safety = [];
private _equipped = (_weapons - [""]) apply {toLowerANSI _x};
private _safed = _unit getVariable [QACEGVAR(safemode,safedWeapons), []];
if (_safed isEqualType createHashMap) then {
    {
        if ((toLowerANSI _x) in _equipped) then {
            private _weapon = _x;
            private _muzzles = switch (true) do {
                case (_y isEqualType createHashMap): {keys _y};
                case (_y isEqualType []): {_y};
                default {[_weapon]};
            };
            { _safety pushBack [_weapon, _x]; } forEach _muzzles;
        };
    } forEach _safed;
} else {
    { if ((toLowerANSI _x) in _equipped) then { _safety pushBack [_x, _x]; }; } forEach _safed;
};

// Items in the loadout in another state (a 2D or PiP optic, a switched laser or light, a loaded
// disposable launcher) and the item each is, as when stashing: Minotaur counts them as that item
// (kits, the Inventory page). Looked up once per class.
if (isNil QGVAR(baseItems)) then { GVAR(baseItems) = createHashMap; };
private _baseItems = [];
{
    private _base = GVAR(baseItems) getOrDefaultCall [_x, {[_x] call EFUNC(armory,getBaseVariant)}, true];
    if (_base != _x) then {
        _baseItems pushBack [_x, _base];
    };
} forEach (((flatten getUnitLoadout _unit) select {_x isEqualType "" && {_x != ""}}) arrayIntersect []);

[
    ["insignia", [_unit] call BIS_fnc_getUnitInsignia],
    ["earplugs", _extended getOrDefault ["ace_earplugs", _unit getVariable ["ACE_hasEarPlugsIn", false]]],
    ["gunbag_weapon", _extended getOrDefault [QACEGVAR(gunbag,gunbagWeapon), []]],
    ["zeroing", _zeroing],
    ["safety", _safety],
    ["base_items", _baseItems]
]
