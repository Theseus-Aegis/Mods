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

    // What players place is persistent, each with its setting (FUNC(registerPlaced)); removed from
    // Chronos when it's deleted (packed up, dug out)
    [QGVAR(staticWeaponDeployed), {
        params ["_weapon"];
        [_weapon, GVAR(vehiclesStaticWeapons)] call FUNC(registerPlaced);
    }] call CBA_fnc_addEventHandler;
    ["ace_trenches_placed", {
        params ["", "_trench"];
        [_trench, GVAR(vehiclesObjects)] call FUNC(registerPlaced);
    }] call CBA_fnc_addEventHandler;
    ["acex_fortify_objectPlaced", {
        params ["", "", "_object"];
        [_object, GVAR(vehiclesObjects)] call FUNC(registerPlaced);
    }] call CBA_fnc_addEventHandler;
    // No event for these: their objects as they're made from now on (placement previews are local, or
    // another class); a CSW tripod goes with static weapons
    {
        [_x, "init", {
            params ["_object"];
            [_object, [GVAR(vehiclesObjects), GVAR(vehiclesStaticWeapons)] select (_object isKindOf "ace_csw_baseTripod")] call FUNC(registerPlaced);
        }, true, ["ACE_SandbagObject_NoGeo"]] call CBA_fnc_addClassEventHandler;
    } forEach ["ACE_SandbagObject", "ACE_TripodObject", "ace_csw_baseTripod"];
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

    // Player killed: the death registered at once (FUNC(handleKilled)), the reply kept for the respawn
    [QGVAR(playerDied), {
        params ["_player", "_uid", ["_deathKey", ""], ["_deathLoadout", []], ["_deathVariables", []]];
        TRACE_1("Player Died",_this);
        GVAR(playerRuntimeData) deleteAt _uid; // a respawn starts fresh
        GVAR(deathsRegistered) set [_uid, ["playerDied", _uid, _deathKey, _deathLoadout, _deathVariables] call FUNC(callServerExt)];
    }] call CBA_fnc_addEventHandler;

    // Player respawned: reloaded (basic gear); a death the killed event didn't register is registered now
    [QGVAR(playerRespawned), {
        params ["_player", "_corpse"];
        TRACE_1("Player Respawned",_this);
        private _uid = getPlayerUID _player;
        private _registeredDeath = GVAR(deathsRegistered) deleteAt _uid;
        if (isNil "_registeredDeath") then {
            GVAR(playerRuntimeData) deleteAt _uid;
            _registeredDeath = ["playerDied", _uid, _corpse getVariable [QGVAR(deathKey), ""], _corpse getVariable [QGVAR(deathLoadout), []], _corpse getVariable [QGVAR(deathVariables), []]] call FUNC(callServerExt);
        };
        [QGVAR(reinitializePlayer), [_player, _registeredDeath], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    // Corpse removal (prevent item multiplication when leaving nicely)
    addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];

    // Start client initialization
    [QGVAR(initialized), []] call CBA_fnc_globalEventJIP;
};

[QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;
[QGVAR(lockerTakeKit), FUNC(lockerTakeKit)] call CBA_fnc_addEventHandler;
[QGVAR(lockerStashAll), FUNC(lockerStashAll)] call CBA_fnc_addEventHandler;
[QGVAR(bodybagReturn), FUNC(bodybagReturn)] call CBA_fnc_addEventHandler;

INFO_3("Server loaded successfully (Players: %1 - Vehicles: %2 - Live API: %3)",GVAR(enabledPlayers),GVAR(enabledVehicles),GVAR(liveApi));
