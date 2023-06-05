#include "script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Sets up a unit as a suicide bomber, they will wait until a player comes within the Activation distance and sprint at them to detonate.
 * Will use either a Satchel charge or a Demolition charge.
 *
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Suicide Bomber <OBJECT>
 * 1: Detonation Radius <NUMBER> (default: 10)
 * 2: Activation Distance <NUMBER> (default: 100)
 * 3: Screaming Distance <NUMBER> (default: 100) (should match activation distance)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bomber] call MFUNC(bomber)
 * [bomber, 15, 50, 50] call MFUNC(bomber)
 */

params ["_unit", ["_detonateRadius", 10], ["_activateDistance", 100], ["_screamingDistance", 100], ["_nearest", objNull]];

if (!is3DENPreview && {!isServer}) exitWith {};

// Add vest, blacklist & set server as owner
_unit addVest "Umi_Bomb_Vest_Camo";

_unit setVariable ["acex_headless_blacklist", true];
(group _unit) setGroupOwner 2;

// Set unit speed & disable relevant AI
_unit setSpeedMode "FULL";
_unit setSpeaker "ACE_NoVoice";

{
    _unit disableAI _x
} forEach ["COVER", "AUTOCOMBAT", "RADIOPROTOCOL", "FSM", "SUPPRESSION"];

private _time = CBA_missionTime;
private _randomExplosive = selectRandom ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_detonateRadius", "_activateDistance", "_screamingDistance", "_time", "_nearest", "_randomExplosive"];

    if (isNull _nearest) exitWith {
        private _players = (call CBA_fnc_players) select {
            isTouchingGround _x && {(_unit distance _x) < _activateDistance}
        };

        if (_players isNotEqualTo []) then {
            _args set [5,  selectRandom _players];
        };
    };

    if (!isNull _nearest && {CBA_missionTime >= _time + 5}) then {
        _unit doMove (position _nearest);
        _args set [4, CBA_missionTime];
    };

    private _distance = _unit distance _nearest;
    private _unitPos = getPosATL _unit;
    private _unconscious = _unit getVariable ["ACE_isUnconscious", false];

    // If unconscious remove PFH and explode randomly within 5 minutes
    if (_unconscious) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _unit setDamage 1;
        [{
            params ["_unit", "_randomExplosive", "_unitPos"];
            [QGVAR(detonation), [_unit, _randomExplosive, _unitPos]] call CBA_fnc_serverEvent;
        }, [_unit, _randomExplosive, _unitPos], (random 300)] call CBA_fnc_waitAndExecute;
    };

    // Screaming
    if (_distance <= _screamingDistance && {alive _unit}) then {
        [_unit, "tacr_kamikaze"] remoteExec ["say3D"];
    };

    // Reached target or dead, either way go boom.
    if (_distance <= _detonateRadius || !alive _unit) then {
        doStop _unit;
        [_handle] call CBA_fnc_removePerFrameHandler;

        [{
            params ["_unit", "_randomExplosive", "_unitPos"];
            [QGVAR(detonation), [_unit, _randomExplosive, _unitPos]] call CBA_fnc_serverEvent;
        }, [_unit, _randomExplosive, _unitPos, _handle], 1] call CBA_fnc_waitAndExecute;
    };
}, 1, [_unit, _detonateRadius, _activateDistance, _screamingDistance, _time, _nearest, _randomExplosive]] call CBA_fnc_addPerFrameHandler;
