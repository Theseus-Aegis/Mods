#include "script_component.hpp"

[QGVAR(setVectorUp), {(_this select 0) setVectorUp (_this select 1)}] call CBA_fnc_addEventHandler;

// Exit on Server and Headless Client
if (!hasInterface) exitWith {};

[QGVAR(BreachingCharge_Place), "init", {
    // Execute in next frame for explosive to be created
    [{
        _this call FUNC(setupBreach);
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

[WIRE_CLASS, "Explosion", { // will fire only where explosion is local
    params ["_wire"];

    private _obstacle = _wire getVariable [QGVAR(obstacle), objNull];
    if (!isNull _obstacle) then {
        [_wire, _obstacle] call FUNC(breach);
    };

    deleteVehicle _wire;
}] call CBA_fnc_addClassEventHandler;

[QGVAR(BreachingCharge_Place), "Deleted", {
    // Wait a frame for possible ammo to be created (arming the explosive)
    [{
        _this call FUNC(handleBreachDeleted);
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;
