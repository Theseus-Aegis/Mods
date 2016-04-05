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
private _weaponHolder = createVehicle ["WeaponHolderSimulated", _bodybag, [], 0, "NONE"];
{
    _weaponHolder addWeaponCargoGlobal [_x, 1];
} forEach _droppedWeapons;
