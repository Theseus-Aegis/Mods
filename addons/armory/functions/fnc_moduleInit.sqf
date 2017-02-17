/*
 * Author: Jonpas
 * Initializes the Armory module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(system), "system"] call ACEFUNC(common,readSettingFromModule);

INFO("Armory Module Initialized.");
