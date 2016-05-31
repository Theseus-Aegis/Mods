/*
 * Author: DaC, Jonpas
 * Sets the vehicle back to operational state.
 *
 * Arguments:
 * 0: Target Vehicle <OBJECT>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

params ["_targetVehicle"];

// Get vehicle and helper object objects
(_targetVehicle getVariable QGVAR(prepared)) params ["_vehicle", "_helper"];

// Prevent damage on vehicle
_vehicle allowDamage false;
_vehicle enableSimulationGlobal false;

// Remove the helper object
deleteVehicle _helper;

// Enable damage on vehicle
_vehicle allowDamage true;
_vehicle enableSimulationGlobal true;

// Remove variable
_vehicle setVariable [QGVAR(prepared), nil, true];

// Show ACE Hint
[localize LSTRING(Detached), QPATHTOF(UI\detach_ca.paa)] call ACE_Common_fnc_displayTextPicture;
