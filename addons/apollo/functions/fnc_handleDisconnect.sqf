/*
 * Author: Jonpas
 * Handles corpse removal on disconnect.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: ID <NUMBER> (unused)
 * 2: UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, 11, "51792927127296126"] call tac_apollo_fnc_handleDisconnect
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "", "_id"];

// @todo - figure out if saving on disconnect is reliable enough
//[_unit, _id, "save"] call playerSaveModule;

// @todo - move bodybag weapon save and check if that weapon in holder into common and use here
private _nearWeaponHolders = nearestObjects [_unit, ["WeaponHolderSimulated"], 3];
_nearWeaponHolders pushBack _unit;
{
    deleteVehicle _x;
} forEach _nearWeaponHolders;
