#include "script_component.hpp"
/*
 * Author: Mike
 * Automatically lowers APC / Tank based aiming accuracy.
 * Call on mission start.
 * Call from initServer.sqf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call MFUNC(apcSkill)
 */

private _allVehicles = vehicles select {(_x isKindOf "Wheeled_APC_F" || _x isKindOf "Tank" && {!isNull gunner _x})};

{
    private _gunner = gunner _x;
    private _gunnerSkill = _gunner skill "aimingAccuracy";
    _gunner setSkill ["aimingAccuracy", (_gunnerSkill / 2)];
} forEach _allVehicles;
