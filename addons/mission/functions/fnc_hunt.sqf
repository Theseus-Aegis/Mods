#include "script_component.hpp"
/*
 * Author: Mike
 * Has an enemy group hunt a player group.
 * If no hunted group is given it will select nearest player group within a given distance and target those.
 *
 * Call from Trigger with (isServer) check.
 *
 * Arguments
 * 0: Hunter Group <GROUP>
 * 1: Waypoint Refresh <NUMBER> (Optional - Default: 5)
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

params ["_hunters", ["_refresh", 5], ["_hunted", grpNull], ["_searchDistance", 1000]];

if (!isServer) exitWith {};

// Headless Blacklist
_hunters setVariable ["acex_headless_blacklist", true, true];

// Switch locality back to server
_hunters setGroupOwner 2;

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
        private _players = (call CBA_fnc_players) select {
            isTouchingGround _x && {(_hunterLeader distance _x) < _searchDistance}
        };

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
    };

    // Check for alive units
    private _huntersDead = {alive _x} count units _hunters == 0;

    // Remove PFH.
    if (_huntersDead) then {
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, _refresh, [_hunters, _refresh, _hunted, _searchDistance]] call CBA_fnc_addPerFrameHandler;
