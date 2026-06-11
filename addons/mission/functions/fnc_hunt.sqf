#include "..\script_component.hpp"
/*
 * Author: Mike
 * Has an enemy group hunt a player group.
 * If no hunted group is given it will select nearest player group within a given distance and target those.
 *
 * Call on the server.
 *
 * Arguments
 * 0: Hunter Group <GROUP>
 * 1: Waypoint Refresh <NUMBER> (Optional - Default: 30)
 * 2: Hunted Group <DEPRECATED>
 * 2: Search Distance <DEPRECATED>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Enemy_Group] call MFUNC(hunt)
 * [Enemy_Group, 10] call MFUNC(hunt)
 * [Enemy_Group, nil, Player_Group] call MFUNC(hunt)
 * [Enemy_Group, nil, nil, 2000] call MFUNC(hunt)
 */

params ["_hunters", ["_refresh", 30], ["_hunted", grpNull], ["_searchDistance", 0]];

if (!isServer) exitWith {};

if (is3DENPreview) then {
    if (_hunters isEqualType "OBJECT") exitWith {
        ERROR_MSG("Input only allows group, detected unit.");
    };
};

GVAR(huntGroups) pushBackUnique _hunters;

// Disable Fleeing, set combat mode and speed mode.
[QGVAR(allowFleeing), [_hunters, 0], _hunters] call CBA_fnc_targetEvent;
[QGVAR(setCombatMode), [_hunters, "YELLOW"], _hunters] call CBA_fnc_targetEvent;
[QGVAR(setSpeedMode), [_hunters, "FULL"], _hunters] call CBA_fnc_targetEvent;

// Initial target group
private _players = [true] call FUNC(players);
private _target = selectRandom _players;

[_hunters, _refresh, _target] call FUNC(huntMove);
