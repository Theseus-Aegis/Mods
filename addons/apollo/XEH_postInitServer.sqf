#include "script_component.hpp"

if (!GVAR(enabled)) exitWith { TRACE_1("Apollo Disabled",GVAR(enabled)) };

// Check Apollo Server presence
private _serverReturn = "tac_apollo_server" callExtension ["version", []]; // ["1.0.0", 0, 0]
_serverReturn params ["_serverVersion"];
if (_serverVersion != REQUIRED_APOLLOSERVER_VERSION) exitWith {
    ERROR_2("Failed to initialize - Wrong Apollo Server extension version (active: %1 - required: %2)!",_serverVersion,REQUIRED_APOLLOSERVER_VERSION);
};

// Set server type (debug or live) globally
private _serverType = ["getServerType"] call FUNC(callServer);
if (_serverType == "error") exitWith {
    ERROR_1("Failed to initialize - Invalid server type (%1)!",_serverType);
};
GVAR(isDebug) = [false, true] select (_serverType isEqualTo "debug");
publicVariable QGVAR(isDebug);

// Reset server if map/mission changed from last saved
private _resetError = false;
if (GVAR(allowServerReset)) then {
    private _reset = ["resetServer", GVAR(enabledPlayers), GVAR(enabledVehicles), serverName, worldName, missionName] call FUNC(callServer);
    if (_reset == "error") exitWith {_resetError = true; };
    if (_reset == "none") exitWith { INFO_3("Server reset not performed (server: %1, map: %2, mission: %3)",serverName,worldName,missionName); };
    INFO_3("Server reset successfully (server: %1, map: %2, mission: %3)",serverName,worldName,missionName);
};
if (_resetError) exitWith { ERROR_3("Server failed to reset after map change! (server: %1, map: %2, mission: %3)",serverName,worldName,missionName); };

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
        private _registeredDeath = ["playerDied", getPlayerUID _player, _killerUID] call FUNC(callServer);
        [QGVAR(reinitializePlayer), [_player, _registeredDeath], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    // Corpse removal (prevent item multiplication when leaving nicely)
    addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];

    // Start client initialization
    [QGVAR(initialized), []] call CBA_fnc_globalEventJIP;
};

[QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;

INFO_3("Server loaded successfully (Players: %1 - Vehicles: %2 - Debug: %3)",GVAR(enabledPlayers),GVAR(enabledVehicles),GVAR(isDebug));
