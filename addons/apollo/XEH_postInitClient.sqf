#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    params ["_enabled", "_enabledPlayers"];

    if (!_enabled || {!_enabledPlayers}) exitWith {};

    // Load player
    private _successfullyLoaded = [player] call FUNC(playerLoadClient);
    // Save load time to prevent instant saving after load
    player setVariable [QGVAR(lastSavedTime), diag_tickTime];

    if (_successfullyLoaded) then {
        ["loadout", {
            params ["_player"]; // second parameter is old loadout, not useful for us

            // Only save if not remote controlling a unit and more than 10 seconds have passed from previous save
            if (_player == player && {!isNull _player} && {alive _player} && {_player getVariable [QGVAR(lastSavedTime), 0] + 10 < diag_tickTime}) then {
                [QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;
                _player setVariable [QGVAR(lastSavedTime), diag_tickTime];
            };
        }] call CBA_fnc_addPlayerEventHandler;
    } else {
        ACE_LOGERROR_1("Player not successfully loaded: %1",profileName);
        ["Your connection has been terminated due an error during Chronos loading"] call FUNC(endMissionError);
    };

    // An error occured on loading or saving
    [QGVAR(terminatePlayer), {
        ["Your connection has been terminated due to unknown error with Chronos"] call FUNC(endMissionError);
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
