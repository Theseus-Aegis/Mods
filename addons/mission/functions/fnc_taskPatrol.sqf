#include "script_component.hpp"
/*
 * Author: Mike
 * Enables CBA_fnc_taskPatrol while supporting HCs.
 *
 * Calls CBA_fnc_taskPatrol, optional decision on removing AI from HC or letting them switch then applying the patrol.
 * https://cbateam.github.io/CBA_A3/docs/files/ai/fnc_taskPatrol-sqf.html
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Disable HC <BOOL>
 * 1: Group <GROUP>
 * 2: Position <GROUP/POSITION> (Optional - default: nil)
 * 3: Radius <NUMBER> (Optional - default: 300)
 * 4: Waypoint count <NUMBER> (Optional - default: 7)
 * 5: Waypoint type <STRING> (Optional - default: "MOVE")
 * 6: Behaviour <STRING> (Optional - default: "AWARE")
 * 7: Combat mode <STRING> (Optional - default: "YELLOW")
 * 8: Speed mode <STRING> (Optional - default: "FULL")
 * 9: Formation <STRING> (Optional - default: "STAG COLUMN")
 * 10: Code to execute at each waypoint <STRING> (Optional - default: "this call CBA_fnc_searchNearby")
 * 11: Timeout at each waypoint <ARRAY> (Min, Med, Max) (Optional - default: [3, 6, 9])
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, MyGroup, getMarkerPos "MyMarker", 100, 3, "MOVE", "COMBAT", "RED", "LIMITED", "WEDGE", "", [0, 0, 0]] call MFUNC(taskPatrol)
 * [true, MyGroup, nil, 300, 7, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [3, 6, 9]] call MFUNC(taskPatrol)
 */

params [
    "_disableHC",
    "_group",
    ["_position", nil],
    ["_radius", 300],
    ["_waypointCount", 7],
    ["_waypointType", "MOVE"],
    ["_behaviour", "AWARE"],
    ["_combatMode", "YELLOW"],
    ["_speedMode", "FULL"],
    ["_formation", "STAG COLUMN"],
    ["_codeToExecute", "this call CBA_fnc_searchNearby"],
    ["_timeout", [3, 6, 9]]
];

if (disableHC) then {
    _group setVariable ["acex_headless_blacklist", true];

    [_this select [1, 11]] call CBA_fnc_taskPatrol;
} else {
    [{
        [_this] call CBA_fnc_taskPatrol;
    }, [_this select [1, 11], 10] call CBA_fnc_waitAndExecute;
};
