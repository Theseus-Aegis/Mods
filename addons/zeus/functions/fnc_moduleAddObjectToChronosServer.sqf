/*
 * Author: Jonpas
 * Adds an object to Chronos persistence (executed on server through server event).
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
private _chronosUniqueID = ["generateUniqueID"] call EFUNC(apollo,invokeJavaMethod);

// Make persistent
_object setVariable [QEGVAR(apollo,vehicleID), _chronosUniqueID, true];
