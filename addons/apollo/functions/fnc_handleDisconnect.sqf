#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles save and corpse removal on disconnect; keeps the state a reconnect gets back (mission only).
 * Dead (killed, not respawned yet): the death is registered already, so nothing is saved and the
 * corpse stays (its gear goes into its bodybag; the player comes back with basic gear).
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
    ERROR_2("Player not saved on disconnect - UID (%1) or LastSavedTime (%2) undefined!",_uid,_lastSavedTime);
};

// Dead: registered when killed (FUNC(handleKilled)); the corpse is left for its bodybag
if (!alive _unit) exitWith {
    GVAR(deathsRegistered) deleteAt _uid;
    INFO_2("Player '%1' (%2) left while dead, not saved",_name,_uid);
};

[_unit, _uid, _name, "save"] call FUNC(playerSingletonSave);
[_unit, _uid] call FUNC(runtimeSave);

deleteVehicle _unit;
