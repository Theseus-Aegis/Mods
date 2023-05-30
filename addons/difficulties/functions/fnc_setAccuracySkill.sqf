#include "script_component.hpp"
/*
 * Author: Mike
 * Sets aiming accuracy skill for APCs and Tanks by factor.
 *
 * Call on mission start.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(setSkill)
 */

params ["_vehicle"];

if (GVAR(skillFactor) == 1) exitWith {};

private _gunner = gunner _vehicle;
private _skillSet = _gunner getVariable [QGVAR(skillFactorSet), false];

if (_skillSet || isNull _gunner || isPlayer _gunner) exitWith {};

private _gunnerSkill = _gunner skill "aimingAccuracy";
_gunner setSkill ["aimingAccuracy", (_gunnerSkill * GVAR(skillFactor))];

_gunner setVariable [QGVAR(skillFactorSet), true];
