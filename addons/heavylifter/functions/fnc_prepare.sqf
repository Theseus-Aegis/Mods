/*
 * Author: DaC, Jonpas
 * Prepares the vehicle for heavy lifting.
 *
 * Arguments:
 * 0: Target Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [heli] call tac_heavylifter_fnc_prepare;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_attachPos", "_vehiclePosOffsetWorld", "_vehiclePosOffset", "_vehicleVectorDirAndUp", "_helper"];
params ["_vehicle"];

// Get vehicle's attachTo position
_attachPos = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(AttachPos));

// Get position and direction to place the helper object at (negate attachTo offset so the vehicle doesn't move by that offset)
_vehiclePosOffsetWorld = _vehicle modelToWorld [-(_attachPos select 0), -(_attachPos select 1), 0];
_vehiclePosOffset = [_vehiclePosOffsetWorld select 0, _vehiclePosOffsetWorld select 1, getPosATL _vehicle select 2];
_vehicleVectorDirAndUp = [vectorDir _vehicle, vectorUp _vehicle];

// Prepare vehicle to be attached to helper object
_vehicle allowDamage false;
_vehicle enableSimulationGlobal false;
_vehicle setPos [0, 0, 0];

// Create helper object on original vehicle location, prevent damage and set orientation
_helper = createVehicle [QGVAR(Helper), _vehiclePosOffset, [], 0, "CAN_COLLIDE"];
_helper allowDamage false;
_helper enableSimulationGlobal false;
_helper setVectorDirAndUp _vehicleVectorDirAndUp;

// Attach vehicle to helper object with offset
_vehicle attachTo [_helper, _attachPos];

// Enable damage on vehicle and helper object
_vehicle allowDamage true;
_vehicle enableSimulationGlobal true;
_helper allowDamage true;
_helper enableSimulationGlobal true;

// Set variable with helper object
_vehicle setVariable [QGVAR(prepared), [_vehicle, _helper], true];

// Show ACE Hint
[localize LSTRING(Attached), QUOTE(PATHTOF(UI\attach_ca.paa))] call ACE_Common_fnc_displayTextPicture;
