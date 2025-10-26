#include "..\script_component.hpp"
/*
 * Author: Mike
 * Selects a random location and moves units to it, area is used for getMissionLayerEntities. Used specifically for replayable missions with the current setup. Params include things for CBA_fnc_taskDefend
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Area <STRING>
 * 2: Radius <NUMBER> (default: 40)
 * 3: Building Threshold <NUMBER> (default: 3)
 * 4: Patrol Chance <NUMBER> (default: 0.25)
 * 5: Hold Chance <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_groups, "Name"] call MFUNC(replayableStatic)
 */

params ["_groups", "_area", ["_radius", 40], ["_buildingThreshold", 3], ["_patrolChance", 0.25], ["_holdChance", 0]];

private _formatStaticLocations = format ["%1 Static Locations", _area];
private _staticLocations = (getMissionLayerEntities _formatStaticLocations) select 0;

{
    [{
        params ["_group", "_locations", "_radius", "_buildingThreshold", "_patrolChance", "_holdChance"];
        private _object = selectRandom _locations;
        private _position = getPosATL _object;

        _locations deleteAt (_locations find _object);
        deleteVehicle _object;

        {
            _x setPosATL _position;
        } forEach (units _group);

        [_group, _group, _radius, _buildingThreshold, _patrolChance, _holdChance] call CBA_fnc_taskDefend;
    }, [_x, _staticLocations, _radius, _buildingThreshold, _patrolChance, _holdChance], _forEachIndex * 3] call CBA_fnc_waitAndExecute;
} forEach _groups;
