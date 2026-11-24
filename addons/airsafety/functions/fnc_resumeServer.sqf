#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Unfreezes the aircraft; the one who resumed it takes the controls if they're the co-pilot, and
 * the aircraft gets back its engine and speed where it's local.
 * Runs on the server.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit who resumed <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player] call tac_airsafety_fnc_resumeServer
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

private _frozen = _vehicle getVariable QGVAR(frozen);
if (isNil "_frozen") exitWith {};
_frozen params ["_velocity", "_uid", "_name"];

_vehicle setVariable [QGVAR(frozen), nil, true];
GVAR(frozen) deleteAt _uid;
_vehicle enableSimulationGlobal true;
INFO_3("%1 resumed %2, frozen when %3 left",name _unit,typeOf _vehicle,_name);

if (driver _vehicle != _unit) then {
    [QGVAR(takeControls), [_vehicle], _unit] call CBA_fnc_targetEvent;
};

// A moment later, once the vehicle is local to whoever flies it now
[{
    params ["_vehicle", "_velocity"];
    if (alive _vehicle) then {
        [QGVAR(restoreVelocity), [_vehicle, _velocity], _vehicle] call CBA_fnc_targetEvent;
    };
}, [_vehicle, _velocity], 0.5] call CBA_fnc_waitAndExecute;
