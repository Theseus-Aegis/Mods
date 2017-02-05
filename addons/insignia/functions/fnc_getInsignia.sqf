/*
 * Author: Jonpas
 * Gets insignia from a player if it's actual player (and not remote controlled or AI).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call tac_insignia_fnc_getInsignia;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (!GVAR(enabled) || {!local _unit} || {_unit != player}) exitWith {};

private _insignia = [_unit] call BIS_fnc_getUnitInsignia;

if (_insignia == "") then {
    _unit setVariable [QGVAR(activeInsignia), QGVAR(logoStitch)];
} else {
    _unit setVariable [QGVAR(activeInsignia), _insignia];
};

TRACE_2("Insignia getted",_unit,_insignia);
