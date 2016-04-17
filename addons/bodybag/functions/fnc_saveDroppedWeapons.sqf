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
#include "script_component.hpp"

params ["_unit"];

private _droppedPrimary = primaryWeapon _unit;
private _droppedSecondary = secondaryWeapon _unit;

private _weapons = [_droppedPrimary, _droppedSecondary] select {_x != ""};

_unit setVariable [QGVAR(droppedWeapons), _weapons, true];

TRACE_3("Dropped Weapons",_droppedPrimary,_droppedSecondary,_weapons);
