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
    params ["_controller", "_name", "_mode", "_targets", "_targetsInvalid"];

    if (_mode == 4) exitWith {};

    if (_name find "Event Test" == -1) exitWith {};

    // Original
    systemChat format ["%1 - %2 - %3", _controller, _mode, _playerName];
    systemChat format ["Old: %1 - %2", _targets, _targetsInvalid];

    // Modified
    private _targetsNew = [_targets select 0, _targets select 1];
    private _targetsInvalidNew = _targetsInvalid + [_targets select 3, _targets select 4];
    systemChat format ["New: %1 - %2", _targetsNew, _targetsInvalidNew];

    // Configure
    [_controller, _name, _mode, _targetsNew, _targetsInvalidNew] call FUNC(configure);
}] call CBA_fnc_addEventHandler;
