#include "script_component.hpp"

if (isServer) then {
    // NVG Assignments
    ["CAManBase", "init", {
        // wait for HMD to be assigned so `hmd _unit` works
        [FUNC(assignNVG), _this, 1] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addClassEventHandler;

    GVAR(assignNVGpfh) = [FUNC(assignNVGpfh), 300] call CBA_fnc_addPerFrameHandler;

    // Detonation, creates an explosive on an object position and deletes the object.
    [QGVAR(detonation), {
        params ["_object", "_explosive", "_objectPos"];
        private _explosive = _explosive createVehicle _objectPos;
        deleteVehicle _object;
        _explosive setDamage 1;
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(say3D), {
    params ["_unit", "_sound"];
    _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

// Exit if not player client
if (!hasInterface) exitWith {};

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;

// dialogue event.
[QGVAR(dialogue), LINKFUNC(dialogueLocal)] call CBA_fnc_addEventHandler;
