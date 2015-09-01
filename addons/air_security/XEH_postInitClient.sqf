#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Add Keybind
["TAC", QGVAR(SetSecurity), localize LSTRING(SetSecurity), {
    if (!isClass (configFile >> "CfgVehicles" >> typeOf (vehicle ACE_player) >> "ACE_SelfActions" >> QGVAR(Secure))) exitWith {false};
    if ([vehicle ACE_player, ACE_player] call FUNC(canSecure) || {[vehicle ACE_player, ACE_player] call FUNC(canUnsecure)}) then {
        [vehicle ACE_player] call FUNC(setSecurity);
    };
    false
}, {false}, [31, [true, false, true]], false] call CBA_fnc_addKeybind; // Alt+Shift+S

// Client EH
["TAC_ratelMarkerCreated", FUNC(createMarker)] call ACE_Common_fnc_addEventHandler;
