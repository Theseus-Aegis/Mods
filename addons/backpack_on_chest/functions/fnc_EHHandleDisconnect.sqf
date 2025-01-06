#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton, MikeMF
 * Triggered by HandleDisconnect-Eventhandler on Server.
 * Handles deleting the chestpack of old units form disconnected players.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call tac_backpack_on_chest_fnc_EHHandleDisconnect;
 *
 * Public: Yes
 */
params ["_unit", "_id", "_uid", "_name"];

if ([_unit] call FUNC(chestpack) isEqualTo "") exitWith {};

[{
     params ["_unit"];
     private _container = _unit call FUNC(chestpackContainer);
     if (!alive _unit) then {
        deleteVehicle _container;
     };
}, _unit, 1.5] call CBA_fnc_waitAndExecute;
