#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles save and corpse removal on disconnect.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: ID <NUMBER> (unused)
 * 2: UID <STRING>
 * 3: Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, 11, "51792927127296126", "Banana"] call tac_apollo_fnc_handleDisconnect
 *
 * Public: No
 */

params ["_unit", "", "_uid", "_name"];
TRACE_1("Handle Disconnect",_this);

// Exit if null unit or saving never started
private _lastSavedTime = _unit getVariable [QGVAR(lastSavedTime), -1];
if (isNull _unit || {_lastSavedTime == -1}) exitWith {
    ERROR_1("Player not saved on disconnect - UID (%1) or LastSavedTime (%2) undefined!",getPlayerUID _player,_lastSavedTime);
};

[_unit, _uid, _name, "save"] call FUNC(playerSingletonSave);

deleteVehicle _unit;
