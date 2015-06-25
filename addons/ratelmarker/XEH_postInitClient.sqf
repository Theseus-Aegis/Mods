#include "script_component.hpp"

// Add Keybinds
["TAC Vehicles", QGVAR(OpenRatelMarker), localize LSTRING(Open), {
    if ([vehicle ACE_player] call FUNC(canUseMarkerMenu)) then {
        call FUNC(createMarkerMenu);
    };
    false
}, {false}, [19, [true, true, true]], false] call cba_fnc_addKeybind; // Ctrl+Alt+Shift+R

// Client EH
["TAC_ratelMarkerCreated", FUNC(createMarker)] call ACE_FUNC(common,addEventHandler);
