#include "script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Sets visibility of units, simulation and AI behaviour of a group along with any vehicles manned by the group.
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Disable <BOOL>
 * 2: Distance <NUMBER> (default: 0)
 * 3: Move to Nearest Player <BOOL> (default: false)
 * 4: Distance to search for player <NUMBER> (default: 1000)
 *
 * Return Value:
 * None
 *
 * Example:
 * [Test_Group_1, true] call MFUNC(reinforcements)
 * [Test_Group_1, false] call MFUNC(reinforcements)
 * [Test_Group_1, false, 50] call MFUNC(reinforcements)
 * [Test_Group_1, false, 0, true, 2000] call MFUNC(reinforcements)
 */

params ["_group", "_state", ["_distance", 0], ["_moveToPlayer", false], ["_searchDistance", 1000]];

if (!isServer) exitWith {};

private _groupLeader = leader _group;
private _playerList = [] call CBA_fnc_players;
private _anyClose = _playerList select {_groupLeader distance _x < _distance};

if (_anyClose isEqualTo [] || CBA_MissionTime == 0) then {
    {
        _x enableSimulationGlobal !_state;
        _x hideObjectGlobal _state;

        private _vehicle = vehicle _x;
        if (_vehicle != _x && {simulationEnabled _vehicle == _state}) then {
            _vehicle enableSimulationGlobal !_state;
            _vehicle hideObjectGlobal _state;
        };
    } forEach (units _group);

    // Orders reinforcement group to hunt nearest player group.
    if (_moveToPlayer) then {
        [{
            params ["_group", "_searchDistance"];
            [_group, nil, nil, _searchDistance] call FUNC(hunt);
        }, [_group, _searchDistance], (random 1) + 10] call CBA_fnc_waitAndExecute;
    };
} else {
    private _groupName = groupID _group;
    private _groupSide = side _group;
    WARNING_2("Too close to group: %1, on: %2",_groupName,_groupSide);
};
