#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(loadTraits), ace_player] call CBA_fnc_serverEvent;
