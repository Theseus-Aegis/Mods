#include "..\script_component.hpp"
/*
 * Author: Josh, Mike
 * Sets units in a sleeping animation, alternative call to wake them up.
 * Only the first argument is required to put units asleep.
 * The other arguments are used for waking up units, if you want an immediate transition set time to -1.
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
 * [MyGroup] call MFUNC(setSleeping)
 * [MyGroup, false, 5] call MFUNC(setSleeping)
 */

params ["_group", ["_asleep", true], ["_time", 0]];

if (_group isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows group, detected unit.");
};

private _units = units _group;

if (_asleep) then {
    {
        _x switchMove "Acts_LyingWounded_loop3";
        _x disableAI "ANIM";
    } forEach (units _group);
} else {
    {
        if (alive _x && {animationState _x == "acts_lyingwounded_loop3"}) then {
            [{
                _this enableAI "ANIM";
                _this switchMove "AmovPpneMstpSrasWrflDnon_healed";
                if (local _x) then {
                    _this playMoveNow "AmovPpneMstpSrasWrflDnon_healed";
                };
            }, _x, _forEachIndex * _time] call CBA_fnc_waitAndExecute;
        };
    } forEach (units _group);
};
