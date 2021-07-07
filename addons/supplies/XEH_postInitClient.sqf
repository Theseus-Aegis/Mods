#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(resetTraits), ace_player] call CBA_fnc_serverEvent;
