#include "script_component.hpp"
/*
 * Author: Josh, Mike
 * Sets units in a sleeping animation, alternative call to wake them up.
 *
 * Call from init.sqf or globally from a trigger.
 *
 * Arguments:
 * 0: Group <Group>
 * 1: Asleep <BOOL> (default: true)
 * 2: Time <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyGroup] call TAC_Mission_fnc_sleeping
 * [MyGroup, false, 5] call TAC_Mission_fnc_sleeping
 */

params ["_group", ["_asleep", true], ["_time", 0]];

if (!local (leader _group)) exitWith {};

private _units = units _group;

if (_asleep) then {
    {
        _x disableAI "ANIM";
        _x switchMove "Acts_LyingWounded_loop3";
    } forEach (units _group);
} else {
    {
        if (alive _x && {animationState _x == "acts_lyingwounded_loop3"}) then {
            [{
                _this enableAI "ANIM";
                _this switchMove "AmovPpneMstpSrasWrflDnon_healed";
                _this playMoveNow "AmovPpneMstpSrasWrflDnon_healed";
            }, _x, _forEachIndex * _time] call CBA_fnc_waitAndExecute;
        };
    } forEach (units _group);
};
