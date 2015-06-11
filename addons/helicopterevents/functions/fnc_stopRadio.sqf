/*
 * Author: DaC, Jonpas
 * Stops playing music in the helicopter and removes the radio.
 *
 * Arguments:
 * 0: Helicopter (Object)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

PARAMS_1(_heli);

private ["_radio"];

// Get radio object (from Variable value)
_radio = _heli getVariable QGVAR(playingRadio);

// If radio is not playing already, then exit (for 'Killed' EH)
if (isNil "_radio") exitWith {};

// Delete then detach (vice-versa causes random explosion)
deleteVehicle _radio;
detach _radio;

// Remove Variable (must remove for ACE's Interaction Menu condition)
_heli setVariable [QGVAR(playingRadio), nil, true];
