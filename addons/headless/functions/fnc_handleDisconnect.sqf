/*
 * Author: Jonpas
 * Handles disconnect.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call tac_headless_handleDisconnect;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if !(_unit in GVAR(headlessClients)) exitWith {};

// Remove HC
GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _unit);

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Removed HC: %1",_unit);
};
