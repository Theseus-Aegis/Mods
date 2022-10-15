#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Prepares the object for heavy lifting.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 * 1: Called from Interaction Menu <BOOL> (default: true)
 * 2: Attach Position (relative to object) <ARRAY> (default: [0, 0, 0])
 * 3: Custom Helper Class <STRING> (default: "tac_heavylifter_Helper")
 *
 * Return Value:
 * Helper <OBJECT>
 *
 * Example:
 * [object] call tac_heavylifter_fnc_prepare
 *
 * Public: No
 */

params ["_target", ["_actionCall", true], ["_attachPos", [0, 0, 0]], ["_helperClass", QGVAR(Helper)]];

// No need to read config as every object that has attach position in config will already have an action and position cached
if (_actionCall) then {
    _attachPos = GVAR(attachPositions) getOrDefault [typeOf _target, _attachPos];
    _helperClass = GVAR(attachHelpers) getOrDefault [typeOf _target, _helperClass];
};

// Get position and direction to place the helper object at (negate attachTo offset so the vehicle doesn't move by that offset)
private _targetPosOffsetWorld = _target modelToWorld [-(_attachPos select 0), -(_attachPos select 1), 0];
private _targetPosOffset = [_targetPosOffsetWorld select 0, _targetPosOffsetWorld select 1, getPosATL _target select 2];
private _targetVectorDirAndUp = [vectorDir _target, vectorUp _target];

// Prepare vehicle to be attached to helper object
[_target, "blockEngine", QUOTE(ADDON), true] call ACEFUNC(common,statusEffect_set);
[_target, "blockDamage", QUOTE(ADDON), true] call ACEFUNC(common,statusEffect_set);
_target enableSimulationGlobal false;
_target setPosASL [0, 0, 0];

// Create helper object on original vehicle location, prevent damage and set orientation
private _helper = createVehicle [_helperClass, _targetPosOffset, [], 0, "CAN_COLLIDE"];
[_helper, "blockDamage", QUOTE(ADDON), true] call ACEFUNC(common,statusEffect_set);
_helper enableSimulationGlobal false;
_helper setVectorDirAndUp _targetVectorDirAndUp;

#ifndef DEBUG_MODE_FULL
_helper setObjectTextureGlobal [0, ""];
#endif

// Attach helper object to vehicle with offset and set relative orientation
_target attachTo [_helper, _attachPos];

// Enable damage on vehicle and helper object
[_target, "blockDamage", QUOTE(ADDON), false] call ACEFUNC(common,statusEffect_set);
_target enableSimulationGlobal true;
[_helper, "blockDamage", QUOTE(ADDON), false] call ACEFUNC(common,statusEffect_set);
_helper enableSimulationGlobal true;

// Set variable with helper object
_target setVariable [QGVAR(prepared), [_target, _helper], true];

if (_actionCall) then {
    [localize LSTRING(Attached), QPATHTOF(UI\attach_ca.paa)] call ACEFUNC(common,displayTextPicture);
};

_helper
