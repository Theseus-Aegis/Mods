#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Add Keybind
["TAC", QGVAR(SetSecurity), localize LSTRING(SetSecurity), {
    private ["_vehicle"];
    _vehicle = vehicle ACE_player;
    if (!isClass (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_SelfActions" >> QGVAR(Secure))) exitWith {false};
    if ([_vehicle, ACE_player] call FUNC(canSecure) || {[_vehicle, ACE_player] call FUNC(canUnsecure)}) then {
        [_vehicle] call FUNC(setSecurity);
    };
    false
}, {false}, [31, [true, false, true]], false] call CBA_fnc_addKeybind; // Alt+Shift+S
