#include "script_component.hpp"

if (!GVAR(enabled)) exitWith { TRACE_1("Apollo Disabled",GVAR(enabled)) };

// Check JNI presence
private _jniReturn = "jni" callExtension ["version", []]; // ["1.0.0", 0, 0]
_jniReturn params ["_jniVersion"];
if (_jniVersion != REQUIRED_JNI_VERSION) exitWith {
    ERROR_2("Failed to initialize - Wrong JNI extension version (active: %1 - required: %2)!",_jniVersion,REQUIRED_JNI_VERSION);
};

// Set server type (debug or live) globally
private _serverType = ["getServerType"] call FUNC(invokeJavaMethod);
GVAR(isDebug) = [false, true] select (_serverType isEqualTo "debug");
publicVariable QGVAR(isDebug);

if (GVAR(enabledVehicles)) then {
    call FUNC(vehicleLoad);
};

if (GVAR(enabledPlayers)) then {
    // Save player
    [QGVAR(savePlayer), {
        params ["_player", "_name", "_type"];
        [_player, getPlayerUID _player, _name, _type] call FUNC(playerSingletonSave);
    }] call CBA_fnc_addEventHandler;

    // Player died
    [QGVAR(playerDied), {
        params ["_player", "_killerUID"];
        TRACE_1("Player Died",_this);
        private _registeredDeath = ["playerDied", getPlayerUID _player, _killerUID] call FUNC(invokeJavaMethod);
        [QGVAR(reinitializePlayer), [_player, _registeredDeath], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    // Corpse removal (prevent item multiplication when leaving nicely) and additional runtime data handler
    addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];

    // Start client initialization
    [QGVAR(initialized), []] call CBA_fnc_globalEventJIP;
};

[QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;

INFO_3("Server loaded successfully (Players: %1 - Vehicles: %2 - Debug: %3)",GVAR(enabledPlayers),GVAR(enabledVehicles),GVAR(isDebug));
