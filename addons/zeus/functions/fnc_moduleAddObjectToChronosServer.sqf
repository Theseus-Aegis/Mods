#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds an object to Chronos persistence (executed on server through server event).
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Player saving object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_zeus_fnc_moduleAddObjectToChronosServer;
 *
 * Public: No
 */

params ["_object", "_player"];

if (!EGVAR(apollo,vehiclesLoaded)) exitWith {
    [QGVAR(addObjectToChronosFailed), [], _player] call CBA_fnc_targetEvent;
};

// Get suitable Chronos ID
private _chronosUniqueID = ["generateUniqueID"] call EFUNC(apollo,invokeJavaMethod);

// Make persistent
_object setVariable [QEGVAR(apollo,vehicleID), _chronosUniqueID, true];
EGVAR(apollo,vehiclesList) pushBack _object;

TRACE_2("Object added to Chronos",_object,_chronosUniqueID);
