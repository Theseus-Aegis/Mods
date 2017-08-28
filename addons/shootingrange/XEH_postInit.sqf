#include "script_component.hpp"

[QGVAR(logResult), {
    INFO_1("%1",_this call FUNC(textsIntoLocalizedString));
}] call CBA_fnc_addEventHandler;

// Exit on Server and Headless Client
if (!hasInterface) exitWith {};

[QGVAR(playSignal), {
    (_this select 0) say3D [_this select 1, _this select 2];
}] call CBA_fnc_addEventHandler;

[QGVAR(notifyPlayer), {
    params ["_texts", "_size"];
    [[_texts] call FUNC(textsIntoLocalizedString), _size] call ACEFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;
