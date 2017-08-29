#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(init), {
    params ["_object"];
    [_object] call FUNC(init);
}] call CBA_fnc_addEventHandler;

[QEGVAR(apollo,lockerActionDone), {
    params ["_player"];
    // Only update if still open
    if (!isNull (_player getVariable [QGVAR(object), objNull])) then {
        TRACE_1("Stash force update",_player);
        [call FUNC(getBoxContents)] call FUNC(updateData);
    };
}] call CBA_fnc_addEventHandler;
