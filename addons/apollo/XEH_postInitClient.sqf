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

        if (_registeredDeath == "done") then {
            // Load player
            private _successfullyLoaded = [_player] call FUNC(playerLoadClient);

            // Save load time to prevent instant saving after load
            _player setVariable [QGVAR(lastSavedTime), CBA_missionTime];

            if (!_successfullyLoaded) exitWith {
                ACE_LOGERROR_2("Player not successfully loaded (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
                ["Your connection has been terminated - Error during Chronos loading!"] call FUNC(endMissionError);
            };
        } else {
            ACE_LOGERROR("Connection terminated - Death failed to register!");
            [localize LSTRING(RespawnReinitialization)] call FUNC(endMissionError);
        };
    }] call CBA_fnc_addEventHandler;

    // Load player
    private _successfullyLoaded = [player] call FUNC(playerLoadClient);

    // Save load time to prevent instant saving after load
    player setVariable [QGVAR(lastSavedTime), CBA_missionTime];

    if (!_successfullyLoaded) exitWith {
        ACE_LOGERROR_2("Player not successfully loaded (Name: %1 - UID: %2)!",profileName,getPlayerUID player);
        ["Your connection has been terminated - Error during Chronos loading!"] call FUNC(endMissionError);
    };

    // Save on each inventory change with at least 10 seconds between each save
    ["loadout", FUNC(handleLoadoutChanged)] call CBA_fnc_addPlayerEventHandler;

    ACE_LOGINFO("Client loaded successfully.");
}] call CBA_fnc_addEventHandler;
