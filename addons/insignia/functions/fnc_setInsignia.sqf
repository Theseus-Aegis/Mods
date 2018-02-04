/*
 * Author: Jonpas
 * Adds insignia to a player if it's actual player (and not remote controlled or AI).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call tac_insignia_fnc_setInsignia
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_2("Trying to add insignia",_unit,GVAR(enabled));

// Don't exit if insignia already set, BIS_fnc_getUnitInsignia will return the last set insignia even if it's currently not visible
if (!GVAR(enabled) || {!local _unit} || {_unit != player}) exitWith {};

private _insignia = _unit getVariable [QGVAR(activeInsignia), QGVAR(logoStitch)];

// Setting insignia fails even if not actually visible (uniform dropped and picked up), so reset manually
[_unit, ""] call BIS_fnc_setUnitInsignia;
[_unit, _insignia] call BIS_fnc_setUnitInsignia;

TRACE_2("Insignia added",_unit,_insignia);
