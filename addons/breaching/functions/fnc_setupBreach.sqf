#include "..\script_component.hpp"
/*
 * Author: Ampers, Jonpas
 * Sets the breaching charge.
 *
 * Arguments:
 * 0: Charge <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_charge] call tac_breaching_fnc_setupBreach
 *
 * Public: No
 */

params ["_charge"];

if (!local _charge) exitWith {};

private _chargePos = getPosASL _charge;

// Best positioning is achieved with VIEW LOD
private _intersections = lineIntersectsSurfaces [_chargePos, _chargePos vectorDiff (vectorDir _charge), _charge, objNull, true, 1, "VIEW"];
if (_intersections isEqualTo []) then {
    // Glass doors are supported only in GEOM LOD
    _intersections = lineIntersectsSurfaces [_chargePos, _chargePos vectorDiff (vectorDir _charge), _charge, objNull, true, 1, "GEOM"];
};
if (_intersections isEqualTo []) exitWith { LOG("no intersections"); };

(_intersections select 0) params ["_intersectPos", "_intersectNormal", "", "_obstacle"];
if (isNull _obstacle) exitWith { LOG("nothing to stick to") }; // terrain intersection returns objNull object
TRACE_3("plant intersection",_obstacle,_intersectPos,_intersectNormal);

private _wire = createVehicle [WIRE_CLASS, ASLToAGL _intersectPos vectorAdd (_intersectNormal vectorMultiply 0.02), [], 0, "CAN_COLLIDE"];
_wire setVectorDirAndUp [[0, 0, -1], [0, 0, 0] vectorDiff _intersectNormal];

_charge attachTo [_wire, [0, 0, -0.06]];
_charge setVectorDirAndUp [vectorDir _wire, [0, -1, 0]];

// Publish data to wire in case locality changes and Explosion/Delete are handled on another machine
_wire setVariable [QGVAR(obstacle), _obstacle, true];
_charge setVariable [QGVAR(wire), _wire, true];
