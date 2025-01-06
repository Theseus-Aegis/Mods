#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Checks if given unit can move its pack(s)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_unit] call tac_backpack_on_chest_fnc_canMovePack;
 *
 * Public: No
 */

params ["_unit"];

if (GVAR(disabled)) exitWith {false};

!(vehicle _unit isKindOf "ParachuteBase") // Can't move pack while in a parachute
