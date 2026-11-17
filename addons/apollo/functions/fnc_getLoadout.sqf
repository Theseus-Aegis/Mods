#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns a unit's loadout as Apollo saves it: ACRE radios filtered. Earplugs in the ears and the gunbag's weapon
 * are kept apart (FUNC(getVariables)).
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

_loadout
