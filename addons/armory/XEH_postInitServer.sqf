#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    params ["_disconnectedPlayer"];
    private _openedObject = _disconnectedPlayer getVariable [QGVAR(object), objNull];
    if (!isNull _openedObject) then {
        _openedObject setVariable [QGVAR(inUse), nil, true];
    };
}];

// Automatically clear cargo of a box that's empty serverside.
[QGVAR(checkContainer), {
    params ["_container"];

    if (_container call FUNC(canClearArmoryBox)) then {
        _container call FUNC(clearArmoryBox);
    };
}] call CBA_fnc_addEventHandler;
