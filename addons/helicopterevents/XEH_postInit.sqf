#include "script_component.hpp"

// Server EH
if (isServer) then {
    ["TAC_hideRadio", {
        PARAMS_1(_radio);
        hideObjectGlobal _radio;
    }] call ACE_FUNC(common,addEventHandler);
};

if (!hasInterface) exitWith {};

// Add Keybinds
["TAC Helicopter Events", QGVAR(OpenRatelMarker), localize LSTRING(RatelMarker), {
    _vehicle = vehicle ACE_player;
    if (_vehicle isKindOf 'Air' && {driver _vehicle == ACE_player || {((assignedVehicleRole ACE_player) select 1) in (allTurrets _vehicle)}}) then {
        call FUNC(createMarkerMenu);
    };
    false
},
{false},
[19, [true, true, true]], false] call cba_fnc_addKeybind; // Ctrl+Alt+Shift+R

// Client EH
["TAC_markerCreated", FUNC(createMarker)] call ACE_FUNC(common,addEventHandler);
