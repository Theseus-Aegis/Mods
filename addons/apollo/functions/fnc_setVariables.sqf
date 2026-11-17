#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts back what's kept across missions out of the loadout (see FUNC(getVariables)), after the loadout is set.
 * Earplugs and the gunbag's weapon go back with the loadout (CBA extended loadout, ACE's own hooks), so this
 * does the insignia now, and zeroing and safety a moment later (ACE resets the scope adjustment when it first
 * sees an optic), only on a weapon that's still the same (and with the same optic, for zeroing).
 * Run where the unit is local.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Variables <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [["insignia", "tac_insignia"]]] call tac_apollo_fnc_setVariables
 *
 * Public: No
 */

params ["_unit", "_variables"];

private _values = createHashMapFromArray (_variables select {_x isEqualType [] && {count _x == 2}});

private _insignia = _values getOrDefault ["insignia", ""];
if (_insignia isEqualType "" && {_insignia != ""} && {isClass (configFile >> "CfgUnitInsignia" >> _insignia)}) then {
    // The function skips a class it thinks is already on, but a new loadout's uniform has none (as ACE Arsenal does)
    _unit setVariable ["BIS_fnc_setUnitInsignia_class", nil];
    [_unit, _insignia] call BIS_fnc_setUnitInsignia;
};

[{
    params ["_unit", "_zeroing", "_safety"];
    if (!alive _unit) exitWith {};
    private _weapons = [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] apply {toLowerANSI _x};

    {
        _x params ["_weapon", "_optic", "_adjustment", "_distance"];
        private _index = _weapons find (toLowerANSI _weapon);
        if (_index == -1 || {((_unit weaponAccessories _weapon) param [2, ""]) != _optic}) then { continue; };

        if (_adjustment isNotEqualTo []) then {
            private _adjustments = _unit getVariable [QACEGVAR(scopes,adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
            _adjustments set [_index, _adjustment];
            _unit setVariable [QACEGVAR(scopes,adjustment), _adjustments, true];
        };

        // The weapon's zeroing steps are numbered: find the one at that distance (false: no such step)
        private _found = false;
        for "_step" from 0 to 40 do {
            if !(_unit setWeaponZeroing [_weapon, _weapon, _step]) exitWith {};
            if (((_unit currentZeroing [_weapon, _weapon]) select 0) == _distance) exitWith { _found = true; };
        };
        if (!_found) then {
            _unit setWeaponZeroing [_weapon, _weapon, 0];
        };
    } forEach _zeroing;

    {
        _x params ["_weapon", "_muzzle"];
        private _index = _weapons find (toLowerANSI _weapon);
        if (_index != -1) then {
            [_unit, [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] select _index, true, false, _muzzle] call ACEFUNC(safemode,setWeaponSafety);
        };
    } forEach _safety;
}, [_unit, _values getOrDefault ["zeroing", []], _values getOrDefault ["safety", []]], 2] call CBA_fnc_waitAndExecute;
