#include "script_component.hpp"

#ifdef DEBUG_MODE_FULL
    [["Test 1", "This is a test button 1"], {"Test 1" call CBA_fnc_notify}] call FUNC(addButton);
    ["Banana", {"Phone" call CBA_fnc_notify}] call FUNC(addButton);
    ["Test 2", {"Test 2" call CBA_fnc_notify}] call FUNC(addButton);
#endif

if (isServer) then {
    [QGVAR(createCurator), {LINKFUNC(addCurator)}] call CBA_fnc_addEventHandler;
};

[["Curator", "Assigning Curator"], {[QGVAR(createCurator), ace_player] call CBA_fnc_serverEvent}] call FUNC(addButton);
