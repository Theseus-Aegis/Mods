#include "..\script_component.hpp"
/*
 * Author: Mike
 * Has an enemy group hunt a player group.
 * If no hunted group is given it will select nearest player group within a given distance and target those.
 * Hunt groups are capped to a maximum of 6 for performance reasons.
 *
 * Call from Trigger with (isServer) check.
 *
 * Arguments
 * 0: Hunter Group <GROUP>
 * 1: Waypoint Refresh <NUMBER> (Optional - Default: 10)
 * 2: Hunted Group <GROUP> (Optional - Default grpNull)
 * 2: Search Distance <NUMBER> (Optional - Default 1000)
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

params ["_hunters", ["_refresh", 10], ["_hunted", grpNull], ["_searchDistance", 1000]];

if (!isServer) exitWith {};

// HC check
if !(leader _hunters getVariable ["acex_headless_blacklist", false]) exitWith {
    ERROR_MSG("Function requires HC blacklist to work.");
};

if (_hunters isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows group, detected unit.");
};

if (count GVAR(huntGroups) >= 6) exitWith {
    ERROR_MSG("The maximum amount of hunt groups has been reached (6)!");
};

// Add hunter group to array.
GVAR(huntGroups) pushBack _hunters;

// Disable Fleeing
{
    _x allowFleeing 0;
} forEach (units _hunters);

_hunters setSpeedMode "FULL";
_hunters setCombatMode "RED";

// PFH for movement
[{
    params ["_args", "_handle"];
    _args params ["_hunters", "_refresh", "_hunted", "_searchDistance"];

    // Select closest player group
    if (isNull _hunted) then {
        private _hunterLeader = leader _hunters;
        private _players = (true call FUNC(players)) select {(_hunterLeader distance _x) < _searchDistance};

        if (_players isNotEqualTo []) then {
            private _hunted = group (selectRandom _players);
            _args set [2, _hunted];
        };
    } else {
        // Get hunted Leader
        private _huntedLeader = leader _hunted;
        // doMove needs an array
        private _hunterUnits = units _hunters;

        // Move to estimated hunted leader position
        private _huntedPos = _huntedLeader getPos [random 100, random 360];
        _hunterUnits doMove _huntedPos;
        _hunters setSpeedMode "FULL";
    };

    // Check for alive units
    private _huntersDead = [[_hunters]] call FUNC(countAlive);

    // Remove PFH and remove group from array
    if (_huntersDead == 0) then {
        GVAR(huntGroups) deleteAt (GVAR(huntGroups) find _hunters);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, _refresh, [_hunters, _refresh, _hunted, _searchDistance]] call CBA_fnc_addPerFrameHandler;
