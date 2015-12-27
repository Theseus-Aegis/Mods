/*
 * Author: Jonpas
 * Adds an object to Chronos persistence (server - executed after local).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_zeus_fnc_moduleAddObjectToChronosServer;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// Get suitable Chronos ID
private _chronosUniqueID = ["generateUniqueID"] call invoke_java_method;

// Make persistent
_object setVariable ["vehicleChronosID", _chronosUniqueID, true];
