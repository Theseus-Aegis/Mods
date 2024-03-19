#include "..\script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Sets visibility of units, simulation and AI behaviour of a group along with any vehicles manned by the group.
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Disable <BOOL> (default: true)
 * 2: Distance <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[Group_1, Group_2]] call MFUNC(reinforcements)
 * [[Group_1, Group_2], false] call MFUNC(reinforcements)
 * [[Group_1, Group_2], false, 50] call MFUNC(reinforcements)
 */

params [["_groups", []], ["_state", true], ["_distance", 0]];

if (!isServer) exitWith {};

// Backward compatibility
if (_groups isEqualType grpNull) then {
    _groups = [_groups];
};

{
    private _groupLeader = leader _x;
    private _anyClose = (true call FUNC(players)) select {_groupLeader distance _x < _distance};

    if (_anyClose isEqualTo [] || CBA_MissionTime == 0) then {
        {
            _x enableSimulationGlobal !_state;
            _x hideObjectGlobal _state;

            private _vehicle = vehicle _x;
            if (_vehicle != _x && {simulationEnabled _vehicle == _state}) then {
                _vehicle enableSimulationGlobal !_state;
                _vehicle hideObjectGlobal _state;
            };
        } forEach (units _x);
    } else {
        private _groupName = groupID _x;
        private _groupSide = side _x;
        WARNING_2("Too close to group: %1, on: %2",_groupName,_groupSide);
    };
} forEach _groups;
