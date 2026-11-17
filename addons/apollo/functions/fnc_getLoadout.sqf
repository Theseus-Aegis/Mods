#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns a unit's loadout as Apollo saves it: ACRE radios filtered, earplugs in the uniform if worn.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Loadout <ARRAY>
 *
 * Example:
 * [player] call tac_apollo_fnc_getLoadout
 *
 * Public: No
 */

params ["_unit"];

private _loadout = getUnitLoadout _unit;

// Filter ACRE2
if (["acre_api"] call ACEFUNC(common,isModLoaded)) then {
    _loadout = [_loadout] call acre_api_fnc_filterUnitLoadout;
};

// Add earplugs to uniform if has them plugged in.
if ((_unit getVariable ["ACE_hasEarPlugsIn", false]) && {((_loadout select 3) isNotEqualTo [])}) then {
    ((_loadout select 3) select 1) pushBack ["ACE_EarPlugs", 1];
};

_loadout
