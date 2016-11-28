/*
 * Author: Jonpas
 * Initializes the Apollo module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY> (unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(enabledPlayers), "enabledPlayers"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(enabledVehicles), "enabledVehicles"] call ACEFUNC(common,readSettingFromModule);

INFO_1("Apollo Module Initialized. Enabled: %1",GVAR(enabled));
