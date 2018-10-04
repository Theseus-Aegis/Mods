#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if RATEL Marker menu can be used.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Use RATEL Marker menu <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_ratelmarker_fnc_canUseMarkerMenu;
 *
 * Public: No
 */

if (!isNil {uiNamespace getVariable QGVAR(menuDisplay)}) exitWith {};

params ["_vehicle"];

private _vehicleRole = assignedVehicleRole ACE_player;

(_vehicle isKindOf "Air") &&
{driver _vehicle == ACE_player ||
    { (_vehicleRole select 0) isEqualTo "Turret" && {(_vehicleRole select 1) in (allTurrets _vehicle)} }
}
