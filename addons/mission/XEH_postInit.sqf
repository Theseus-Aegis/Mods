#include "script_component.hpp"

// Detonation, creates an explosive on an object position and deletes the object.
[QGVAR(detonation), {
    params ["_object", "_explosive", "_objectPos"];
    private _explosive = _explosive createVehicle _objectPos;
    deleteVehicle _object;
    _explosive setDamage 1;
}] call CBA_fnc_addEventHandler;

// Exit if not player client
if (!hasInterface) exitWith {};

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;

// dialogue event.
[QGVAR(dialogue), LINKFUNC(dialogueLocal)] call CBA_fnc_addEventHandler;
