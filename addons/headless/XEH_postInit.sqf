#include "script_component.hpp"

// Exit on player clients that are not hosts
if (hasInterface && !isServer) exitWith {};

["SettingsInitialized", {
    // Exit if HC passing disabled
    if (!GVAR(Enabled)) exitWith {};

    if (isServer) then {
        addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
        [FUNC(transferGroups), [], GVAR(Delay)] call ACE_Common_fnc_waitAndExecute; // Start passing
    } else {
        // Register HC on server (this part happens on HC only)
        ["TAC_HeadlessClientJoined", [player]] call ACE_Common_fnc_serverEvent;
    };
}] call ACE_Common_fnc_addEventHandler
