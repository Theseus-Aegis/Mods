#include "script_component.hpp"

if (isServer) then {
    // Detonation, creates an explosive on an object position and deletes the object.
    [QGVAR(detonation), {
        params ["_object", "_explosive", "_objectPos"];
        private _explosive = _explosive createVehicle _objectPos;
        deleteVehicle _object;
        _explosive setDamage 1;
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(allowFleeing), {(_this select 0) allowFleeing (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(disableAI), {(_this select 0) disableAI (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(doArtilleryFire), {(_this select 0) doArtilleryFire (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(doMove), {(_this select 0) doMove (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(enableAI), {(_this select 0) enableAI (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(say3D), {(_this select 0) say3D (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setCombatMode), {(_this select 0) setCombatMode  (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setDir), {(_this select 0) setDir (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setSpeedMode), {(_this select 0) setSpeedMode (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setUnitPos), {(_this select 0) setUnitPos (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleAmmo), {(_this select 0) setVehicleAmmo (_this select 1)}] call CBA_fnc_addEventHandler;

// Exit if not player client
if (!hasInterface) exitWith {};

HLC_ShowBarrelActions = false; // Remove NiArms Barrel Actions
CUP_stopLampCheck = true; // Disable CUP street lights based on lighting levels (bad performance script)

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;

[QGVAR(dialogue), LINKFUNC(dialogueLocal)] call CBA_fnc_addEventHandler;
