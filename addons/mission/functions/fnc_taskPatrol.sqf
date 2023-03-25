#include "script_component.hpp"
/*
 * Author: Mike
 * Wrapper for CBA_fnc_taskPatrol with Headless Client support.
 *
 * Calls CBA_fnc_taskPatrol, optional decision on removing AI from HC or letting them switch then applying the patrol.
 * Optional argument defaults can be found on the CBA Wiki.
 * https://cbateam.github.io/CBA_A3/docs/files/ai/fnc_taskPatrol-sqf.html
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Disable HC <BOOL>
 * 1: Group <GROUP>
 * 2: Position <GROUP/POSITION> (Optional)
 * 3: Radius <NUMBER> (Optional)
 * 4: Waypoint count <NUMBER> (Optional)
 * 5: Waypoint type <STRING> (Optional)
 * 6: Behaviour <STRING> (Optional)
 * 7: Combat mode <STRING> (Optional)
 * 8: Speed mode <STRING> (Optional)
 * 9: Formation <STRING> (Optional)(Optional)
 * 10: Code to execute at each waypoint <STRING> (Optional)
 * 11: Timeout at each waypoint <ARRAY> (Min, Med, Max) (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, [MyGroup]] call MFUNC(taskPatrol)
 * [false, [MyGroup, getMarkerPos "MyMarker", 100, 3, "MOVE", "COMBAT", "RED", "LIMITED", "WEDGE", "", [0, 0, 0]]] call MFUNC(taskPatrol)
 * [true, [MyGroup, nil, 300, 7, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this call CBA_fnc_searchNearby", [3, 6, 9]]] call MFUNC(taskPatrol)
 */

params ["_disableHC", "_taskArgs"];

if (disableHC) then {
    _group setVariable ["acex_headless_blacklist", true];

    _taskArgs call CBA_fnc_taskPatrol;
} else {
    [{
        [_this] call CBA_fnc_taskPatrol;
    }, _taskArgs, 10] call CBA_fnc_waitAndExecute;
};
