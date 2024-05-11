#include "..\script_component.hpp"
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

// Add vest
_unit addVest "Umi_Bomb_Vest_Camo";

[QACEGVAR(common,setSpeaker), [_unit, "ACE_NoVoice"]] call CBA_fnc_globalEvent;

{
    _unit disableAI _x
} forEach ["COVER", "AUTOCOMBAT", "RADIOPROTOCOL", "FSM", "SUPPRESSION"];

private _time = CBA_missionTime;
private _randomExplosive = selectRandom ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_detonateRadius", "_activateDistance", "_screamingDistance", "_time", "_nearest", "_randomExplosive"];

    if (isNull _nearest) exitWith {
        private _players = ([true] call FUNC(players)) select {(_unit distance _x) < _activateDistance};

        if (_players isNotEqualTo []) then {
            _args set [5,  selectRandom _players];
        };
    };

    if (CBA_missionTime >= _time + 5) then {
        [QGVAR(doMove), [_unit, position _nearest], _unit] call CBA_fnc_targetEvent;
        [QGVAR(setSpeedMode), [_unit, "FULL"], _unit] call CBA_fnc_targetEvent;
        [QGVAR(setUnitPos), [_unit, "UP"], _unit] call CBA_fnc_targetEvent;
        [QGVAR(setCombatBehaviour), [_unit, "CARELESS"], _unit] call CBA_fnc_targetEvent;
        _args set [4, CBA_missionTime];
    };

    private _distance = _unit distance _nearest;
    private _unitPos = getPosATL _unit;
    private _unconscious = _unit getVariable ["ACE_isUnconscious", false];

    // If unconscious remove PFH and explode
    if (_unconscious) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _unit setDamage 1;
        [{
            [QGVAR(detonation), _this] call CBA_fnc_serverEvent;
        }, [_unit, _randomExplosive, _unitPos], 1] call CBA_fnc_waitAndExecute;
    };

    // Screaming
    if (_distance <= _screamingDistance && {alive _unit}) then {
        [QGVAR(say3D), [_unit, "tacr_kamikaze"]] call CBA_fnc_globalEvent;
    };

    // Reached target or dead, either way go boom.
    if (_distance <= _detonateRadius || !alive _unit) then {
        doStop _unit;
        [_handle] call CBA_fnc_removePerFrameHandler;

        [{
            [QGVAR(detonation), _this] call CBA_fnc_serverEvent;
        }, [_unit, _randomExplosive, _unitPos], 1] call CBA_fnc_waitAndExecute;
    };
}, 1, [_unit, _detonateRadius, _activateDistance, _screamingDistance, _time, _nearest, _randomExplosive]] call CBA_fnc_addPerFrameHandler;
