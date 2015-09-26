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
#include "script_component.hpp"

params ["_vehicle"];

(_vehicle isKindOf "Air") &&
{driver _vehicle == ACE_player ||
    {((assignedVehicleRole ACE_player) select 1) in (allTurrets _vehicle)}
}
