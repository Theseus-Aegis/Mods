/*
 * Author: Jonpas
 * Initializes the Apollo module.
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

[_logic, QGVAR(system), "system"] call ACE_Common_fnc_readSettingFromModule;

// Extract objects from logic
private _objects = [_logic getVariable ["Objects", ""], true, true] call ACE_Common_fnc_parseList;
_objects append (synchronizedObjects _logic); // Add objects synced to the module

// Initialize objects with Armory
{
    _x call FUNC(init);
} forEach _objects;

ACE_LOGINFO("Armory Module Initialized.");
