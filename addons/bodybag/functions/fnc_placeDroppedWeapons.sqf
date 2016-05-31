/*
 * Author: Jonpas
 * Places dropped weapons on the ground. They are removed when body is removed.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 * 1: Body Bag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [killed, bodybag] call tac_bodybag_fnc_placeDroppedWeapons
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_bodybag"];

private _droppedWeapons = _unit getVariable [QGVAR(droppedWeapons), []];
TRACE_1("Place Weapons",_droppedWeapons);

if (_droppedWeapons isEqualTo []) exitWith {};

private _weaponHolder = createVehicle ["WeaponHolderSimulated", _bodybag, [], 0, "CAN_COLLIDE"];
{
    _weaponHolder addWeaponCargoGlobal [_x, 1];
} forEach _droppedWeapons;

// Move weapons to body bag position next frame for the body bag handling to be finished
[{
    params ["_weaponHolder", "_bodybag"];
    _weaponHolder setPosASL (getPosASL _bodybag);
}, [_weaponHolder, _bodybag]] call CBA_fnc_execNextFrame;

TRACE_4("Weapons Position",_weaponHolder,getPosASL _weaponHolder,_bodybag,getPosASL _bodybag);
