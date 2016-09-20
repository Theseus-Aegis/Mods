/*
 * Author: Jonpas
 * Handles unit visibility and simulation on connect during loading.
 * Restores state if not player, for players state is restored after successfully loading.
 * isPlayer and getPlayerUID are not guaranteed to be set when this runs, thus wait.
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

// No simulation toggling due to possible lag breaking correct position and direction setting
_unit hideObjectGlobal true;
TRACE_4("Handle Client Connect",_unit,isObjectHidden _unit,isPlayer _unit,getPlayerUID _unit);

// Exit if already player (when loading in with server client init finishes sooner)
if (isPlayer _unit) exitWith {
    TRACE_1("Handle Client Connect - Is Player",_unit);
};

// Wait until becomes player or 5 seconds, restores state if not player
[{
    params ["_unit", "_timeStart"];
    isPlayer _unit || {_timeStart + 5 < CBA_missionTime}
}, {
    params ["_unit"];

    if (!isPlayer _unit) then {
        _unit hideObjectGlobal false;
        TRACE_4("Handle Client Connect - Not Player",_unit,isObjectHidden _unit,isPlayer _unit,getPlayerUID _unit);
    } else {
        TRACE_4("Handle Client Connect - Delayed Is Player",_unit,isObjectHidden _unit,isPlayer _unit,getPlayerUID _unit);
    };
}, [_unit, CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;
