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
 * [unit] call tac_insignia_fnc_setInsignia;
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_unit"];

if (local _unit && {_unit == player}) then {
    [_unit, QGVAR(logoStitch)] call BIS_fnc_setUnitInsignia;
    TRACE_2("Insignia added",_unit,player);
} else {
    TRACE_2("Insignia NOT added",_unit,player);
};
