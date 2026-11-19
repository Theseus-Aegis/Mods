#include "script_component.hpp"

if (!GVAR(enabled)) exitWith { TRACE_1("Apollo Disabled",GVAR(enabled)) };

// Check Apollo Server presence
private _serverReturn = "tac_apollo_server" callExtension ["version", []]; // ["1.0.0", 0, 0]
_serverReturn params ["_serverVersion"];
if (_serverVersion != REQUIRED_APOLLOSERVER_VERSION) exitWith {
    ERROR_2("Failed to initialize - Wrong Apollo Server extension version (active: %1 - required: %2)!",_serverVersion,REQUIRED_APOLLOSERVER_VERSION);
};

// Website the server uses (live or development), players use the same
GVAR(liveApi) = ("tac_apollo_server" callExtension ["getApi", []]) select 0 == "live";
publicVariable QGVAR(liveApi);

// Set server type (debug or live) globally
private _serverType = ["getServerType"] call FUNC(callServerExt);
if (_serverType == "error") exitWith {
    ERROR_1("Failed to initialize - Invalid server type (%1)!",_serverType);
};
GVAR(isDebug) = [false, true] select (_serverType isEqualTo "debug");
publicVariable QGVAR(isDebug);

// Reset server if map/mission changed from last saved
private _resetError = false;
if (GVAR(allowServerReset)) then {
    private _reset = ["resetServer", GVAR(enabledPlayers), GVAR(enabledVehicles), serverName, worldName, missionName] call FUNC(callServerExt);
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
        params ["_player", "_name", "_type", ["_variables", nil], ["_radios", nil], ["_dials", []]];
        private _uid = getPlayerUID _player;
        // What only the player's machine knows, for this and the disconnect save
        if (!isNil "_variables") then {
            _player setVariable [QGVAR(clientState), [_variables, _radios, _dials]];
        };
        [_player, _uid, _name, _type] call FUNC(playerSingletonSave);

        // Reconnected: back as they were when they left (mission only)
        if (_type == "validate") then {
            private _runtime = GVAR(playerRuntimeData) deleteAt _uid;
            if (isNil "_runtime") exitWith {};
            _runtime params ["_group", "_team", "_vehicle", "_seat", "_medical", "_runtimeRadios", ["_runtimeDials", []]];
            if (!isNull _group && {side _group == side group _player}) then {
                [_player] join _group;
            };
            [QGVAR(runtimeApply), [_player, _team, _vehicle, _seat, _medical, _runtimeRadios, _runtimeDials], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;

    // Player died
    [QGVAR(playerDied), {
        params ["_player", ["_deathKey", ""], ["_deathLoadout", []], ["_deathVariables", []]];
        TRACE_1("Player Died",_this);
        GVAR(playerRuntimeData) deleteAt (getPlayerUID _player); // a respawn starts fresh
        private _registeredDeath = ["playerDied", getPlayerUID _player, _deathKey, _deathLoadout, _deathVariables] call FUNC(callServerExt);
        [QGVAR(reinitializePlayer), [_player, _registeredDeath], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    // Corpse removal (prevent item multiplication when leaving nicely)
    addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];

    // Start client initialization
    [QGVAR(initialized), []] call CBA_fnc_globalEventJIP;
};

[QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;
[QGVAR(lockerTakeKit), FUNC(lockerTakeKit)] call CBA_fnc_addEventHandler;
[QGVAR(bodybagReturn), FUNC(bodybagReturn)] call CBA_fnc_addEventHandler;

INFO_4("Server loaded successfully (Players: %1 - Vehicles: %2 - Debug: %3 - Live API: %4)",GVAR(enabledPlayers),GVAR(enabledVehicles),GVAR(isDebug),GVAR(liveApi));
