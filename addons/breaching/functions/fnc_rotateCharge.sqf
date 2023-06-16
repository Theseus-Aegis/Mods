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

[{
    params ["_chargePos"];

    private _nearAmmos = _chargePos nearObjects [QGVAR(BreachingCharge_Ammo), 0.5];
    LOG_1("near ammos: %1",_nearAmmos);

    if (_nearAmmos isEqualTo []) exitWith {
        false
    };

    private _ammo = _nearAmmos select 0;
    _this set [1, _ammo];

    !isNull _ammo
}, {
    params ["", "_ammo"];

    if (!local _ammo) exitWith {};

    _ammo setVectorUp [0, -1, 0];
    LOG_1("rotate charge ammo: %1",_ammo);
}, [_chargePos, objNull], 1] call CBA_fnc_waitUntilAndExecute;
