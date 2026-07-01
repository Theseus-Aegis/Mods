#include "..\script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Sets visibility of units, simulation and AI behaviour of a group along with any vehicles manned by the group.
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Disable <BOOL> (default: true)
 * 2: Distance <DEPRECATED>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[Group_1, Group_2]] call MFUNC(reinforcements)
 * [[Group_1, Group_2], false] call MFUNC(reinforcements)
 */

params [["_groups", []], ["_state", true], ["_distance", 0]];

if (!isServer) exitWith {};

// Backward compatibility
if (_groups isEqualType grpNull) then {
    _groups = [_groups];
};

{
    {
        _x enableSimulationGlobal !_state;
        _x hideObjectGlobal _state;

        private _vehicle = vehicle _x;
        if (_vehicle != _x && {simulationEnabled _vehicle == _state}) then {
            _vehicle enableSimulationGlobal !_state;
            _vehicle hideObjectGlobal _state;
        };
    } forEach (units _x);
} forEach _groups;
