#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    // Check ApolloClient presenece and version
    private _apolloClientVersion = "ApolloClient" callExtension "version";
    if (_apolloClientVersion == "") exitWith {
        ERROR("Failed to initialize - Missing ApolloClient extension!");
        ["Your connection has been terminated - Missing ApolloClient extension!"] call FUNC(endMissionError);
    };
    if (_apolloClientVersion != "1.1") exitWith {
        ERROR_1("Failed to initialize - Wrong ApolloClient extension version (active: %1 - required: 1.1)!",_apolloClientVersion);
        [format ["Your connection has been terminated - Wrong ApolloClient extension version (active: %1 - required: 1.1)!", _apolloClientVersion]] call FUNC(endMissionError);
    };

    // Terminate to lobby EH
    [QGVAR(terminatePlayer), {
        ERROR("Connection terminated - Unknown error with Chronos!");
        ["Your connection has been terminated - Unknown error with Chronos!"] call FUNC(endMissionError);
    }] call CBA_fnc_addEventHandler;

    // Load player after Respawn EH
    [QGVAR(reinitializePlayer), {
        params ["_player", "_registeredDeath"];
        TRACE_1("Registered Death",_this);

        // Load player
        if (_registeredDeath == "done") then {
            // Prevent saving during reinitialization
            _player setVariable [QGVAR(lastSavedTime), CBA_missionTime];
            // Reinitialize
            call FUNC(initializeGear);
            INFO("Client respawned successfully.")
        } else {
            ERROR("Connection terminated - Death failed to register!");
            [localize LSTRING(RespawnReinitialization)] call FUNC(endMissionError);
        };
    }] call CBA_fnc_addEventHandler;

    // Load client, add inventory one frame after removing initial inventory to prevent possible inventory desync
    player allowDamage false;
    call FUNC(initializeGear);
}] call CBA_fnc_addEventHandler;
