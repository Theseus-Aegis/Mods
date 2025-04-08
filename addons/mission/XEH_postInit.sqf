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
[QGVAR(setCombatBehaviour), {(_this select 0) setCombatBehaviour (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setCombatMode), {(_this select 0) setCombatMode  (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setDir), {(_this select 0) setDir (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setSpeedMode), {(_this select 0) setSpeedMode (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setUnitPos), {(_this select 0) setUnitPos (_this select 1)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleAmmo), {(_this select 0) setVehicleAmmo (_this select 1)}] call CBA_fnc_addEventHandler;

[QGVAR(say3D), {
    params ["_object", "_sound", ["_maxDistance", 100], ["_pitch", 1], ["_isSpeech", 1], ["_offset", 0], ["_speedOfSound", false]];
    _object say3D [_sound, _maxDistance, _pitch, _isSpeech, _offset, _speedOfSound];
}] call CBA_fnc_addEventHandler;

// Exit if not player client
if (!hasInterface) exitWith {};

HLC_ShowBarrelActions = false; // Remove NiArms Barrel Actions
CUP_stopLampCheck = true; // Disable CUP street lights based on lighting levels (bad performance script)

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;

// Dialogue & Logging
[QGVAR(dialogue), LINKFUNC(dialogueLocal)] call CBA_fnc_addEventHandler;
ace_player createDiarySubject ["Communications Log", "Communications Log"];
