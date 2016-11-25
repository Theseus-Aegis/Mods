#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Add Keybind
["TAC", QGVAR(OpenRatelMarker), localize LSTRING(Open), {
    systemChat format ["call ss - %1", CBA_missionTime];
    if ([vehicle ACE_player] call FUNC(canUseMarkerMenu)) then {
        call FUNC(createMarkerMenu);
    };
    false
}, {false}, [19, [true, true, true]], false] call CBA_fnc_addKeybind; // Ctrl+Alt+Shift+R

// Client EH
[QGVAR(created), FUNC(createMarker)] call CBA_fnc_addEventHandler;
