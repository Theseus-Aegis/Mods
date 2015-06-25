/*
 * Author: DaC, Jonpas
 * Stops playing music in the vehicle and removes the radio.
 *
 * Arguments:
 * 0: Vehicle (Object)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_stopRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_vehicle);

private ["_radio"];

// Get radio object (from Variable value)
_radio = _vehicle getVariable QGVAR(playingRadio);

// If radio is not playing already, then exit (for 'Killed' EH)
if (isNil "_radio") exitWith {};

// Delete then detach (vice-versa causes random explosion)
deleteVehicle _radio;
detach _radio;

// Remove Variable (must remove for ACE's Interaction Menu condition)
_vehicle setVariable [QGVAR(playingRadio), nil, true];
