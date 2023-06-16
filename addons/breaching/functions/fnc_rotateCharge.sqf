#include "script_component.hpp"
/*
 * Author: Ampers, Jonpas
 * Rotate a charge appropriately
 *
 * Arguments:
 * 0: Charge <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_charge] call tac_breaching_fnc_rotateCharge
 *
 * Public: No
 */

params ["_charge"];

if (!local _charge) exitWith {};

private _chargePos = getPosASL _charge;

#ifdef DEBUG_MODE_FULL
createVehicle ["Sign_Sphere25cm_F", _chargePos, [], 0, "CAN_COLLIDE"];
#endif

private _ammo = objNull;
[{
    private _nearAmmos = _chargePos nearObjects [QGVAR(BreachingCharge_Ammo), 0.5];
    LOG_1("near ammos: %1",_nearAmmos);
    if (_nearAmmos isEqualTo []) exitWith {
        false
    };
    _this = _nearAmmos select 0;
    !isNull _this
}, {
    if (!local _this) exitWith {};
    LOG_1("rotate charge: %1",_this);
    _this setVectorUp [0, -1, 0];
}, _ammo, 1] call CBA_fnc_waitUntilAndExecute;
