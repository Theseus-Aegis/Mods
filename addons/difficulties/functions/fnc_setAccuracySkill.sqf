#include "script_component.hpp"
/*
 * Author: Mike
 * Modifies aiming accuracy skill.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(setAccuracySkill)
 */

params ["_vehicle"];

if (GVAR(gunnerAccuracyFactor) == 1) exitWith {};

private _gunner = gunner _vehicle;
private _skillSet = _gunner getVariable [QGVAR(skillFactorSet), nil];

if (!isNil _skillSet || isNull _gunner || isPlayer _gunner) exitWith {};

private _gunnerSkill = _gunner skill "aimingAccuracy";
_gunner setSkill ["aimingAccuracy", (_gunnerSkill * GVAR(gunnerAccuracyFactor))];

_gunner setVariable [QGVAR(skillFactorSet), _gunnerSkill];
