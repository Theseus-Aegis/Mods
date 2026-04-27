#include "..\script_component.hpp"
/*
 * Author: Mike
 * Checks if armory box can be cleared
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Clear Armory <BOOL>
 *
 * Example:
 * [object] call tac_armory_fnc_canClearArmoryBox
 *
 * Public: No
 */

params ["_object"];

if (itemCargo _object isNotEqualTo []) exitWith {
    true
};

if (weaponCargo _object isNotEqualTo []) exitWith {
    true
};

if (magazineCargo _object isNotEqualTo []) exitWith {
    true
};

if (backpackCargo _object isNotEqualTo []) exitWith {
    true
};

false
