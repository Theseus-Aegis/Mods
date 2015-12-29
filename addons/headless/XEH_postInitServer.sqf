#include "script_component.hpp"

["SettingsInitialized", {
    // Start HC handling only if enabled
    if (GVAR(Enabled)) then {
        // Handle Disconnect
        addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];

        // Start passing
        [FUNC(pass), [], GVAR(Delay)] call ACE_Common_fnc_waitAndExecute;
    };
}] call ACE_Common_fnc_addEventHandler
