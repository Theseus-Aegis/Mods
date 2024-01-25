#include "..\script_component.hpp"
/*
 * Author: Mike
 * Unhides reinforcements in waves set by a timer.
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Time between groups <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[Test_Group_1, Test_Group_2], 10] call MFUNC(reinforcementWaves)
 * [MY_GROUP_ARRAY, 20] call MFUNC(reinforcementWaves);
 */

params ["_groups", "_time"];

if ((_groups select 0) isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows groups, detected unit.");
};

{
    [{
        [_this, false] call FUNC(reinforcements);
    }, _x, _forEachIndex * _time] call CBA_fnc_waitAndExecute;
} forEach _groups;
