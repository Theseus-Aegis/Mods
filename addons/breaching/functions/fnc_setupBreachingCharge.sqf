#include "script_component.hpp"
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
 * [_charge] call tac_breaching_fnc_setupBreachingCharge
 *
 * Public: No
 */

params ["_charge"];

if (!local _charge) exitWith {};

private _chargePos = getPosASL _charge;

// Best positioning is achieved with "VIEW" LOD
private _intersections = lineIntersectsSurfaces [_chargePos, _chargePos vectorDiff (vectorDir _charge), _charge];
if (_intersections isEqualTo []) exitWith { LOG("no intersections"); };

(_intersections select 0) params ["_intersectPos", "_intersectNormal", "", "_obstacle"];
if (isNull _obstacle) exitWith { LOG("nothing to stick to") }; // terrain intersection returns objNull object
TRACE_3("plant intersection",_obstacle,_intersectPos,_intersectNormal);

private _wire = createVehicle [WIRE_CLASS, ASLToAGL _intersectPos vectorAdd (_intersectNormal vectorMultiply 0.02), [], 0, "CAN_COLLIDE"];
_wire setVectorDirAndUp [[0, 0, -1], [0, 0, 0] vectorDiff _intersectNormal];

_charge attachTo [_wire, [0, 0, 0]];
_charge setVectorDirAndUp [vectorDir _wire, [0, -1, 0]];

[_wire, "Explosion", {
    params ["_wire"];
    _thisArgs params ["_obstacle"];

    [_wire, _obstacle] call FUNC(breach);
    deleteVehicle _wire;
}, [_obstacle]] call CBA_fnc_addBISEventHandler;

[_charge, "Deleted", {
    params ["_charge"];
    _thisArgs params ["_wire"];
    TRACE_1("charge deleted",_charge);

    // Wait a frame for possible ammo to be created (arming the explosive), then check if deletion is valid
    [{
        params ["_charge", "_wire"];

        private _nearAmmo = _charge nearObjects [QGVAR(BreachingCharge_Ammo), 0.5];
        if (_nearAmmo isEqualTo []) then {
            TRACE_1("wire deleted",_wire);
            deleteVehicle _wire;
        };
    }, [_charge, _wire]] call CBA_fnc_execNextFrame;
}, [_wire]] call CBA_fnc_addBISEventHandler;
