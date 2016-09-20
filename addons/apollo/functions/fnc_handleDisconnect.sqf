/*
 * Author: Jonpas
 * Handles save and corpse removal on disconnect.
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

params ["_unit", "", "_uid"];
TRACE_1("Handle Disconnect",_this);

if (isNull _unit) exitWith {
    ACE_LOGERROR_1("Player not saved on disconnect - null unit (UID: %1)!",getPlayerUID _player);
};

[_unit, _uid, "save"] call FUNC(playerSingletonSave);

deleteVehicle _unit;
