#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles deletion of curator modules on disconnect.
 *
 * Arguments:
 * 0: Unit <OBJECT> (Unused)
 * 1: ID <NUMBER> (Unused)
 * 2: UID <STRING>
 * 3: Name <STRING> (Unused)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_unit", "_id", "_uid", "_name"];

if (GVAR(playerCurators) isEqualTo []) exitWith {};

private _moduleData = GVAR(playerCurators) select {_uid in _x} select 0;
deleteVehicle (_moduleData select 0);

GVAR(playerCurators) deleteAt (GVAR(playerCurators) find _moduleData);
