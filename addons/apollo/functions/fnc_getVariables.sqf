#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns what's kept across missions out of the loadout, as [name, value] pairs for the website.
 * Run where the unit is local (safety and zeroing are only known there).
 * - insignia: the insignia class ("" none)
 * - earplugs: in the ears (ACE Hearing)
 * - gunbag_weapon: the weapon in an ACE gunbag ([weapon, [attachments], [[magazine, rounds], ...]] or [])
 * - zeroing: per equipped weapon [weapon, optic, ACE scopes adjustment ([] if none), zeroing distance]
 * - safety: [[weapon, muzzle], ...] on safe (ACE safe mode)
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
        private _optic = (_unit weaponAccessories _x) param [2, ""];
        private _adjustment = _adjustments param [_forEachIndex, []];
        if !(_adjustment isEqualType [] && {count _adjustment == 3}) then { _adjustment = []; };
        _zeroing pushBack [_x, _optic, _adjustment, _unit currentZeroing [_x, _x]];
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

[
    ["insignia", _unit call BIS_fnc_getUnitInsignia],
    ["earplugs", _extended getOrDefault ["ace_earplugs", _unit getVariable ["ACE_hasEarPlugsIn", false]]],
    ["gunbag_weapon", _extended getOrDefault [QACEGVAR(gunbag,gunbagWeapon), []]],
    ["zeroing", _zeroing],
    ["safety", _safety]
]
