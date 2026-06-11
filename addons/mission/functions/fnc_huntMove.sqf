#include "..\script_component.hpp"
/*
 * Author: Mike
 * Loops the movement of hunting units, not to be called manually.
 *
 * Called on the server from FUNC(hunt)
 *
 * Arguments:
 * 0: Hunter Group <GROUP>
 * 1: Waypoint Refresh <NUMBER> (Optional - Default: 30)
 * 2: Target <OBJECT>
 *
 * Return Value:
 * None
 */

params ["_hunters", "_refresh", "_target"];

// Reset hunt target if target is dead or in spectator
if (!alive _target || _target getVariable [QACEGVAR(spectator,isSet), false]) exitWith {
    [_hunters, _refresh] call FUNC(hunt);
};

// Exit if hunters are dead.
if ([[_hunters]] call FUNC(countAlive) == 0) exitWith {
    GVAR(huntGroups) deleteAt (GVAR(huntGroups) find _hunters);
};

private _huntUnits = units _hunters;
private _targetPosition = getPosATL _target;
[QGVAR(doMove), [_huntUnits, _targetPosition], _hunters] call CBA_fnc_targetEvent;

// Loop the doMove
[{
    params ["_hunters", "_refresh", "_target"];
    [_hunters, _refresh, _target] call FUNC(huntMove);
}, [_hunters, _refresh, _target], _refresh] call CBA_fnc_waitAndExecute;
