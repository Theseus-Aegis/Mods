#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Attaches a radio to a vehicle and starts playing the selected track on it.
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

// Create and Attach the radio object to the helicopter
private _radio = "Sign_Sphere10cm_F" createVehicle position _vehicle; // Non-collidable
_radio attachTo [_vehicle, [0, 0, 0]];

// Make the radio object invisible (MP and SP support)
[QACEGVAR(common,hideObjectGlobal), [_radio, true]] call CBA_fnc_serverEvent; // hideObjectGlobal must be executed on server

// Set Variable for menu conditions
_vehicle setVariable [QGVAR(playingRadio), _radio, true];

// Star playing music on radio object
[QGVAR(play), [_radio, _track]] call CBA_fnc_globalEvent;
