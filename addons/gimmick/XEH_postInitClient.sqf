#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

// Talking Armory Boxes
[QEGVAR(armory,Locker), "containerOpened", {
    [QGVAR(talkingBoxEvent), _this] call CBA_fnc_serverEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;
