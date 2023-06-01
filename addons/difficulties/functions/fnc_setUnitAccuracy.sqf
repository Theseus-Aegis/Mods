#include "script_component.hpp"
/*
 * Author: Mike
 * Modifies aiming accuracy skill of a unit with Armory Accuracy Factor.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reset to Original Accuracy <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call FUNC(setUnitAccuracy)
 */

params ["_unit", ["_reset", false]];

if (!local _unit || {isNull _unit} || {isPlayer _unit} || {!_reset && {GVAR(armorAccuracyFactor) == 1}}) exitWith {};

private _originalAccuracy = _unit getVariable [QGVAR(originalAccuracy), nil];

if (_reset) exitWIth {
    if (!isNil "_originalAccuracy") then {
        _unit setVariable [QGVAR(originalAccuracy), nil, true];
        _unit setSkill ["aimingAccuracy", _originalAccuracy];
    };
};

if (isNil "_originalAccuracy") then {
    _originalAccuracy = _unit skill "aimingAccuracy";
    _unit setVariable [QGVAR(originalAccuracy), _originalAccuracy, true];
    _unit setSkill ["aimingAccuracy", _originalAccuracy * GVAR(armorAccuracyFactor)];
};
