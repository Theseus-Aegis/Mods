#include "script_component.hpp"
/*
 * Author: Mike
 * Enables CBA_fnc_taskDefend while supporting HCs.
 *
 * Calls CBA_fnc_taskDefend, optional decision on removing AI from HC or letting them switch then applying the defend.
 * Optional argument defaults can be found on the CBA Wiki.
 * https://cbateam.github.io/CBA_A3/docs/files/ai/fnc_taskDefend-sqf.html
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Disable HC <BOOL>
 * 1: Group <GROUP>
 * 2: Position <GROUP/MARKERPOS> (Optional)
 * 3: Radius <NUMBER> (Optional)
 * 4: Threshold <NUMBER> (Optional)
 * 5: Patrol Chance <NUMBER> (Optional)
 * 6: Hold Garrison Chance (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, [MyGroup]] call MFUNC(taskDefend)
 * [false, [MyGroup, getMarkerPos "MyMarker", 100, 1, 0.5, 0.5]] call MFUNC(taskDefend)
 * [true, [MyGroup, MyGroup, 50, 3, false, true]] call MFUNC(taskDefend)
 */

params [
    "_disableHC",
    "_taskArgs"
];

if (disableHC) then {
    _group setVariable ["acex_headless_blacklist", true];

    _taskArgs call CBA_fnc_taskDefend;
} else {
    [{
        [_this] call CBA_fnc_taskDefend;
    }, _taskArgs, 10] call CBA_fnc_waitAndExecute;
};
