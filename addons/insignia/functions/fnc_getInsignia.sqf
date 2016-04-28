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

if (!local _unit || !(_unit == player)) exitWith {};

GVAR(activeInsignia) = [_unit] call BIS_fnc_getUnitInsignia;
TRACE_2("Insignia getted",_unit,GVAR(activeInsignia));
