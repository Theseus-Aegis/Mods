/*
 * Author: Jonpas
 * Handles player visibility and simulation on connect during loading.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call tac_apollo_fnc_handleConnect
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Exit if not player
if (!isPlayer _unit) exitWith {
    TRACE_2("Handle Client Connect - Not Player",_unit,isPlayer _unit);
};

_unit enableSimulationGlobal false;
_unit hideObjectGlobal true;

TRACE_1("Handle Client Connect",isObjectHidden _unit);
