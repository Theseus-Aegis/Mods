#include "script_component.hpp"

if (!isServer) exitWith {};

["SettingsInitialized", {
    // Start Headless Clients passing if enabled
    if (GVAR(Enabled)) then {
        // Extract Headless Clients
        private _headlessClients = [GVAR(HeadlessClients), true, true] call ACE_Common_fnc_parseList;

        // Start passing
        [FUNC(passToHCs), [_headlessClients, GVAR(Delay), GVAR(Log)], GVAR(Delay)] call ACE_Common_fnc_waitAndExecute;
    };
}] call ACE_Common_fnc_addEventHandler
