#include "script_component.hpp"
/*
 * Author: Ampers, Jonpas
 * Plants a charge.
 *
 * Arguments:
 * 0: Charge <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_charge] call tac_breaching_fnc_plantCharge
 *
 * Public: No
 */

params ["_charge"];

private _chargePos = getPosASL _charge;
private _intersections = lineIntersectsSurfaces [_chargePos, _chargePos vectorDiff (vectorDir _charge), _charge, objNull, true, 1, "GEOM"];

if (_intersections isEqualTo []) exitWith { LOG("no intersections"); };

(_intersections select 0) params ["_intersectPos", "_intersectNormal", "", "_obstacle"];
if (isNull _obstacle) exitWith { LOG("nothing to stick to") };

// Wire loop
private _wire = createVehicle [WIRE_CLASS, ASLToAGL _intersectPos vectorAdd (_intersectNormal vectorMultiply 0.08), [], 0, "CAN_COLLIDE"];
_wire setVectorDirAndUp [[0, 0, -1], [0, 0, 0] vectorDiff _intersectNormal];

// Attach
_charge attachTo [_wire, [0, 0, 0.00]];
_charge setVectorDirAndUp [vectorDir _wire, [0, -1, 0]];

[_wire, "Explosion", {
    _thisArgs params ["_charge", "_obstacle"];
    [_charge, _obstacle] call FUNC(breachObstacle);
    deleteVehicle _charge;
}, [_charge, _obstacle]] call CBA_fnc_addBISEventHandler;
