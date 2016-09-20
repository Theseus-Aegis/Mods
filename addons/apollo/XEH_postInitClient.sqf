#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    // Check ApolloClient presenece and version
    private _apolloClientVersion = "ApolloClient" callExtension "version";
    if (_apolloClientVersion == "") exitWith {
        ACE_LOGERROR("Failed to initialize - Missing ApolloClient extension!");
        ["Your connection has been terminated - Missing ApolloClient extension!"] call FUNC(endMissionError);
    };
    if (_apolloClientVersion != "1.1") exitWith {
        ACE_LOGERROR_1("Failed to initialize - Wrong ApolloClient extension version (active: %1 - required: 1.1)!",_apolloClientVersion);
        [format ["Your connection has been terminated - Wrong ApolloClient extension version (active: %1 - required: 1.1)!", _apolloClientVersion]] call FUNC(endMissionError);
    };

    // Terminate to lobby EH
    [QGVAR(terminatePlayer), {
        ACE_LOGERROR("Connection terminated - Unknown error with Chronos!");
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
            if ([_player] call FUNC(playerLoadClient)) then {
                ACE_LOGINFO("Client respawned successfully.")
            };
        } else {
            ACE_LOGERROR("Connection terminated - Death failed to register!");
            [localize LSTRING(RespawnReinitialization)] call FUNC(endMissionError);
        };
    }] call CBA_fnc_addEventHandler;

    // Load player and exit if loading failed
    if !([player] call FUNC(playerLoadClient)) exitWith {};

    // Save on each inventory change and every 10s with a delay between each save
    ["loadout", FUNC(playerSaveClient)] call CBA_fnc_addPlayerEventHandler;
    [FUNC(playerSaveClient), [player, [], true], SAVE_DELAY_PERIODIC] call CBA_fnc_waitAndExecute;

    ACE_LOGINFO("Client loaded successfully.");
}] call CBA_fnc_addEventHandler;
