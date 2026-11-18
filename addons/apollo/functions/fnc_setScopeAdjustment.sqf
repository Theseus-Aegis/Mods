#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts ACE scope values back on a weapon slot: elevation, windage and the zero reference, each only if given and
 * within the optic's turret limits (as ACE checks its own saved zero reference). Run where the unit is local, after
 * ACE has seen the weapon and optic (it resets the slot when they change).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon slot (0 primary, 1 launcher, 2 handgun) <NUMBER>
 * 2: Elevation <NUMBER> (default: nil, unchanged)
 * 3: Windage <NUMBER> (default: nil, unchanged)
 * 4: Zero reference <NUMBER> (default: nil, unchanged)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0, nil, nil, 0.2] call tac_apollo_fnc_setScopeAdjustment
 *
 * Public: No
 */

params ["_unit", "_index", ["_elevation", nil], ["_windage", nil], ["_zero", nil]];

if !(missionNamespace getVariable [QACEGVAR(scopes,enabled), false]) exitWith {};

// [[min, max] elevation, its step, [min, max] windage, its step], per slot
((missionNamespace getVariable [QACEGVAR(scopes,scopeAdjust), []]) param [_index, []]) params [["_vertical", [0, 0]], "", ["_horizontal", [0, 0]]];
_vertical params ["_minVertical", "_maxVertical"];
_horizontal params ["_minHorizontal", "_maxHorizontal"];

private _adjustments = +(_unit getVariable [QACEGVAR(scopes,adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]]);
private _slot = +(_adjustments select _index);
private _fnc_within = {
    params ["_value", "_min", "_max"];
    _value isEqualType 0 && {_value >= _min} && {_value <= _max}
};

if (!isNil "_elevation" && {[_elevation, _minVertical, _maxVertical] call _fnc_within}) then { _slot set [0, _elevation]; };
if (!isNil "_windage" && {[_windage, _minHorizontal, _maxHorizontal] call _fnc_within}) then { _slot set [1, _windage]; };
if (!isNil "_zero" && {[_zero, _minVertical, _maxVertical] call _fnc_within}) then { _slot set [2, _zero]; };

if (_slot isEqualTo (_adjustments select _index)) exitWith {};
_adjustments set [_index, _slot];
[_unit, QACEGVAR(scopes,adjustment), _adjustments, 0.5] call ACEFUNC(common,setVariablePublic);
