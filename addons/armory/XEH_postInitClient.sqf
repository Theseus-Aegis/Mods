#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(init), {
    params ["_object"];
    [_object] call FUNC(init);
}] call CBA_fnc_addEventHandler;
