#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Checks if given unit can cut its lowering line
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Success <BOOLEAN>
 *
 * Example:
 * [_unit] call tac_backpack_on_chest_fnc_canCutLoweringLine;
 *
 * Public: No
 */

params ["_unit"];

if (GVAR(disabled)) exitWith {false};

private _chute = vehicle _unit;

_chute isKindOf "ParachuteBase"
&& {!isNull (_chute getVariable [QGVAR(loweringLine), objNull])}
