#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Starts playing the selected track on vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Music Track <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_playRadio;
 *
 * Public: No
 */

params ["_vehicle", "_track"];
TRACE_2("Play",_vehicle,_track);

// Star playing music on radio object
[QGVAR(play), [_vehicle, _track]] call CBA_fnc_globalEvent;
