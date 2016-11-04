#include "script_component.hpp"

if (isServer) then {
    [QGVAR(logResult), {
        INFO_1("%1",_this);
    }] call CBA_fnc_addEventHandler;
};

// Exit on Server and Headless Client
if (!hasInterface) exitWith {};

[QGVAR(playSignal), {
    (_this select 0) say3D [_this select 1, _this select 2];
}] call CBA_fnc_addEventHandler;


// Debug
[QGVAR(started), {
    params ["_controller", "_mode", "_playerName", "_targets"];

    if (_mode == 4) exitWith {
        systemChat "mode 4";
    };

    // Original
    systemChat format ["%1 - %2 - %3", _controller, _mode, _playerName];
    systemChat format ["Old: %1", _targets];

    // Modified
    _targets = [_targets select 0, _targets select 1];
    systemChat format ["New: %1", _targets];

    // Configure
    [_controller, _targets, [], []] call FUNC(configure);
}] call CBA_fnc_addEventHandler;
