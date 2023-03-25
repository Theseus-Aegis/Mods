#include "script_component.hpp"

// Exit if not player client
if (!hasInterface) exitWith {};

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;

// dialogue event.
[QGVAR(dialogue), {
    _this call FUNC(dialogueLocal);
}] call CBA_fnc_addEventHandler;
