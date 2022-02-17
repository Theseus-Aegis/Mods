#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    // Check ApolloClient presenece and version
    private _apolloClientVersion = "tac_apollo_client" callExtension "version";
    if (_apolloClientVersion != REQUIRED_APOLLOCLIENT_VERSION) exitWith {
        ERROR_2("Failed to initialize - Wrong Apollo Client extension version (active: %1 - required: %2)!",_apolloClientVersion,REQUIRED_APOLLOCLIENT_VERSION);
        [format ["Your connection has been terminated - Wrong Apollo Client extension version (active: %1 - required: %2)!", _apolloClientVersion, REQUIRED_APOLLOCLIENT_VERSION]] call FUNC(endMissionError);
    };

    // Terminate to lobby EH
    [QGVAR(terminatePlayer), {
        params ["_player"];
        _player setVariable [QGVAR(lastSavedTime), -1, true];
        ERROR("Connection terminated - Unknown error with Chronos!");
        ["Your connection has been terminated - Unknown error with Chronos!"] call FUNC(endMissionError);
    }] call CBA_fnc_addEventHandler;

    // Load player after Respawn EH
    [QGVAR(reinitializePlayer), {
        params ["_player", "_registeredDeath"];
        TRACE_1("Reinitialization",_this);

        if (_registeredDeath == "done") then {
            // Prevent saving during reinitialization
            _player setVariable [QGVAR(lastSavedTime), -1, true];
            // Reinitialize client
            [_player, "respawned"] call FUNC(playerLoadClient);
        } else {
            ERROR("Connection terminated - Death failed to register!");
            [localize LSTRING(RespawnReinitialization)] call FUNC(endMissionError);
        };
    }] call CBA_fnc_addEventHandler;

    // Load player
    // Delay load as Arma sync will reset/break position if set too early
    // Possibly avoids breaking inventory with setUnitLoadout as well
    [{
        [player, "loaded"] call FUNC(playerLoadClient);
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
