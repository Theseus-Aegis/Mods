#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Told to the crew when the aircraft is frozen
[QGVAR(notify), {
    params ["_text"];
    [_text, 4] call ACEFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;

// Back in the pilot's seat after reconnecting (the server checks it's still free)
[QGVAR(reseat), {
    params ["_vehicle"];
    if (isNull objectParent ACE_player && {alive _vehicle} && {isNull driver _vehicle}) then {
        ACE_player moveInDriver _vehicle;
    };
}] call CBA_fnc_addEventHandler;

// After the resume, where the vehicle is local: engine on and the speed it had, so a plane doesn't stall
[QGVAR(restoreVelocity), {
    params ["_vehicle", "_velocity"];
    _vehicle engineOn true;
    _vehicle setVelocityModelSpace _velocity;
}] call CBA_fnc_addEventHandler;

// The co-pilot who resumed takes the controls (there's no pilot)
[QGVAR(takeControls), {
    params ["_vehicle"];
    if (currentPilot _vehicle != ACE_player) then {
        ACE_player action ["TakeVehicleControl", _vehicle];
    };
}] call CBA_fnc_addEventHandler;

// Tell the server once the player is in, so a pilot who lost the connection gets their seat back
[{!isNull ACE_player && {alive ACE_player}}, {
    [QGVAR(reconnected), [ACE_player, getPlayerUID ACE_player]] call CBA_fnc_serverEvent;
}] call CBA_fnc_waitUntilAndExecute;
