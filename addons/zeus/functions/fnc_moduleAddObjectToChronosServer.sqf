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

// Exit if Chronos invoker is not compiled - @todo remove once Chronos is ported
if (isNil QEFUNC(chronos,invokeJavaMethod)) exitWith { ACE_LOGERROR("Chronos invokeJavaMethod not found!"); };

// Get suitable Chronos ID
private _chronosUniqueID = ["generateUniqueID"] call EFUNC(chronos,invokeJavaMethod);

// Make persistent
_object setVariable ["vehicleChronosID", _chronosUniqueID, true];
