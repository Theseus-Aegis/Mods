#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    // Prevent double initialization due to CBA_fnc_globalEventJIP
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
    ["loadout", {
        params ["_player"]; // second parameter is old loadout, not useful for us

        // Only save if not remote controlling a unit and more than 10 seconds have passed from previous save
        if (_player == player && {!isNull _player} && {alive _player} && {(_player getVariable [QGVAR(lastSavedTime), 0]) + 10 <= diag_tickTime}) then {
            [QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;
            _player setVariable [QGVAR(lastSavedTime), diag_tickTime];
        };
    }] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
