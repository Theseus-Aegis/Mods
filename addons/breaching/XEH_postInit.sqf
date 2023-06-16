#include "script_component.hpp"

if (!hasInterface) exitWith {};

[QGVAR(BreachingCharge_Place), "init", {
    // Execute in next frame for explosive to be created
    [{
        _this call FUNC(setupBreachingCharge);
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

// clackerAdded event requires CBA_fnc_execNextFrame, this one does not
[QACEGVAR(explosives,place), {
    params ["_explosive"];
    _explosive setVectorUp [0, -1, 0];
}] call CBA_fnc_addEventHandler;
