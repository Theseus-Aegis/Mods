#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns the ACE scope dials (elevation and windage) of the unit's weapons, kept for the mission only so a reconnect
 * gets them back (FUNC(runtimeApply)); a new mission starts with them at zero, as ACE resets them on every load.
 * The zero reference is kept across missions instead (FUNC(getVariables)).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * [[slot, weapon, optic, elevation, windage, simplified zeroing], ...] <ARRAY>
 *
 * Example:
 * [player] call tac_apollo_fnc_getScopeDials
 *
 * Public: No
 */

params ["_unit"];

if !(missionNamespace getVariable [QACEGVAR(scopes,enabled), false]) exitWith {[]};

private _simplified = missionNamespace getVariable [QACEGVAR(scopes,simplifiedZeroing), false];
private _adjustments = _unit getVariable [QACEGVAR(scopes,adjustment), []];
private _dials = [];
{
    (_adjustments param [_forEachIndex, []]) params [["_elevation", 0], ["_windage", 0]];
    if (_x != "" && {_elevation isEqualType 0} && {_windage isEqualType 0}) then {
        _dials pushBack [_forEachIndex, _x, (_unit weaponAccessories _x) param [2, ""], _elevation, _windage, _simplified];
    };
} forEach [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];

_dials
