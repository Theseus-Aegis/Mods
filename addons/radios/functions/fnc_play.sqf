#include "..\script_component.hpp"
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
 * [vehicle, "tac_radios_track1"] call tac_radios_fnc_playRadio
 *
 * Public: No
 */

params ["_vehicle", "_track"];

[QGVAR(play), [_vehicle, _track]] call CBA_fnc_globalEvent;
