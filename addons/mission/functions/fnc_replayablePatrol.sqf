#include "..\script_component.hpp"
/*
 * Author: Mike
 * Selects a random location and moves units to it, area is used for getMissionLayerEntities. Used specifically for replayable missions with the current setup. Params includes things for CBA_fnc_taskPatrol
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Area <STRING>
 * 2: Radius <NUMBER> (default: 60)
 * 2: Waypoint Count <NUMBER> (default: 7)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_groups, "Name"] call MFUNC(replayablePatrol)
 */

params ["_groups", "_area", ["_radius", 60], ["_waypointCount", 7]];

// Patrol Units
private _formatPatrolLocations = format ["%1 Patrol Locations", _area];
private _patrolLocations = (getMissionLayerEntities _formatPatrolLocations) select 0;

{
    [{
        params ["_group", "_locations", "_radius", "_waypointCount"];
        private _object = selectRandom _locations;
        private _position = getPosATL _object;

        _locations deleteAt (_locations find _object);
        deleteVehicle _object;

        {
            _x setPosATL _position;
        } forEach (units _group);

        [QGVAR(taskPatrol), [_group, _group, _radius, _waypointCount, "MOVE", "SAFE", "YELLOW", "LIMITED"]] call CBA_fnc_globalEvent;
    }, [_x, _patrolLocations, _radius, _waypointCount], _forEachIndex * 3] call CBA_fnc_waitAndExecute;
} forEach _groups;
