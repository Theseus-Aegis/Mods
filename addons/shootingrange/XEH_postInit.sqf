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
