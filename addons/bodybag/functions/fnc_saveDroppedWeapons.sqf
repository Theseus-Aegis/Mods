#include "script_component.hpp"
/*
 * Author: Jonpas
 * Saves dropped weapons to a variable on the unit. Workaround for restoring dropped weapons which get deleted with deleteVehicle.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [killed] call tac_bodybag_fnc_saveDroppedWeapons
 *
 * Public: No
 */

params ["_unit"];

private _droppedWeapons = [];
private _droppedItems = [];

_droppedWeapons pushBack (primaryWeapon _unit);
_droppedItems append (primaryWeaponItems _unit);
_droppedItems append (primaryWeaponMagazine _unit);
_droppedWeapons pushBack (secondaryWeapon _unit);
_droppedItems append (secondaryWeaponItems _unit);
_droppedItems append (secondaryWeaponMagazine _unit);

// Handgun only gets dropped if it's currently selected
if (currentWeapon _unit == handgunWeapon _unit) then {
    _droppedWeapons pushBack (handgunWeapon _unit);
    _droppedItems append (handgunItems _unit);
    _droppedItems append (handgunMagazine _unit);
};

_unit setVariable [QGVAR(droppedWeapons), _droppedWeapons, true];
_unit setVariable [QGVAR(droppedItems), _droppedItems, true];

TRACE_2("Dropped Weapons",_droppedWeapons,_droppedItems);
