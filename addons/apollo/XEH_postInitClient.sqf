#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(initialized), {
    params ["_enabled", "_enabledPlayers"];

    if (!_enabled || {!_enabledPlayers}) exitWith {};

    // Load player
    private _successfullyLoaded = [player] call FUNC(playerLoadClient);

    if (_successfullyLoaded) then {
        [FUNC(playerSaveClient), [player], 30] call CBA_fnc_waitAndExecute;
    } else {
        ACE_LOGERROR_1("Player not successfully loaded: %1",profileName);
        ["Your connection has been terminated due an error during Chronos loading"] call FUNC(endMissionError);
    };

    // An error occured on loading or saving
    [QGVAR(terminatePlayer), {
        ["Your connection has been terminated due to unknown error with Chronos"] call FUNC(endMissionError);
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
