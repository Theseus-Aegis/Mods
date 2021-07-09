#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(setTraits), {
    _this params ["_player", "_trait"];

    _player setUnitTrait [_trait, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), ace_player] call CBA_fnc_serverEvent;
