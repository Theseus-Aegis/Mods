#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    // Prevent double initialization due to CBA_fnc_globalEventJIP
    // Temporary fix - source fix: https://github.com/CBATeam/CBA_A3/pull/418 (remove after CBA >2.4.1)
    if (player getVariable [QGVAR(initialized), false]) exitWith {};
    player setVariable [QGVAR(initialized), true];

    // Check ApolloClient presenece and version
    private _apolloClientVersion = "ApolloClient" callExtension "version";
    if (_apolloClientVersion == "") exitWith {
        ACE_LOGERROR("Apollo failed to initialize - Missing ApolloClient extension!");
        ["Your connection has been terminated - Missing ApolloClient extension!"] call FUNC(endMissionError);
    };
    if (_apolloClientVersion != "1.1") exitWith {
        ACE_LOGERROR_1("Apollo failed to initialize - Wrong ApolloClient extension version (active: %1 - required: 1.1)!",_apolloClientVersion);
        [format ["Your connection has been terminated - Wrong ApolloClient extension version (active: %1 - required: 1.1)!", _apolloClientVersion]] call FUNC(endMissionError);
    };

    // Terminate to lobby EH
    [QGVAR(terminatePlayer), {
        ["Your connection has been terminated - Unknown error with Chronos!"] call FUNC(endMissionError);
    }] call CBA_fnc_addEventHandler;

    // Load player
    private _successfullyLoaded = [player] call FUNC(playerLoadClient);
    // Save load time to prevent instant saving after load
    player setVariable [QGVAR(lastSavedTime), diag_tickTime];

    if (!_successfullyLoaded) exitWith {
        ACE_LOGERROR_2("Player not successfully loaded (Name: %1 - UID: %2)!",profileName,getPlayerUID player);
        ["Your connection has been terminated - Error during Chronos loading!"] call FUNC(endMissionError);
    };

    // Save on each inventory change with at least 10 seconds between each save
    ["loadout", FUNC(handleLoadoutChanged)] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
