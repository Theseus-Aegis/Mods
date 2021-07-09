#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(setTraits), {
    ace_player setUnitTrait [_this, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), ace_player] call CBA_fnc_serverEvent;
