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

params ["_unit", ["_detonateRadius", 10], ["_activateDistance", 100], ["_screamingDistance", 100]];

if (!is3DENPreview && {!isServer}) exitWith {};

// Add vest
_unit addVest "Umi_Bomb_Vest_Camo";

// Disable voice & combat reactions
[QACEGVAR(common,setSpeaker), [_unit, "ACE_NoVoice"]] call CBA_fnc_globalEvent;
[QGVAR(setCombatBehaviour), [_unit, "CARELESS"]] call CBA_fnc_globalEvent;
[QGVAR(setSpeedMode), [_unit, "FULL"], _unit] call CBA_fnc_globalEvent;
[QGVAR(setUnitPos), [_unit, "UP"], _unit] call CBA_fnc_globalEvent;

{
    [QGVAR(disableAI), [_unit, _x]] call CBA_fnc_globalEvent;
} forEach ["COVER", "AUTOCOMBAT", "RADIOPROTOCOL", "FSM", "SUPPRESSION"];

// Use marker for inArea checks
private _markerPos = position _unit;
private _markerName = format ["Bomber_Marker_%1", _markerPos];
private _marker = createMarkerLocal [_markerName, _markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [_activateDistance, _activateDistance];

private _time = CBA_missionTime;

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_detonateRadius", "_activateDistance", "_screamingDistance", "_time", "_markerName", ["_target", objNull]];

    // Find a target, not necessarily nearest, if bomber has been killed before activation it'll eventually make it down to detonate.
    if (isNull _target && alive _unit) exitWith {
        private _players = [true] call MFUNC(players);
        private _inAreaCheck = _players findIf {_x inArea _markerName};

        if (_inAreaCheck != -1) then {
            _args set [6, (_players select _inAreaCheck)];
        };
    };

    if (CBA_missionTime >= _time + 3) then {
        [QGVAR(doMove), [_unit, position _target], _unit] call CBA_fnc_targetEvent;
        _args set [4, CBA_missionTime];
    };

    private _distanceToTarget = _unit distance _target;
    if (_distanceToTarget <= _screamingDistance) then {
        [_unit, "tacr_kamikaze", 100] call CBA_fnc_globalSay3D;
    };

    private _detonateCondition = [_unit, _distanceToTarget, _detonateRadius] call FUNC(bomberDetonateCondition);
    if (_detonateCondition) then {
        deleteMarkerLocal _markerName;
        _handle call CBA_fnc_removePerFrameHandler;
        private _unitPos = getPosATL _unit;
        private _randomExplosive = selectRandom ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"];
        [{
            [QGVAR(detonation), _this] call CBA_fnc_serverEvent;
        }, [_unit, _randomExplosive, _unitPos], 1] call CBA_fnc_waitAndExecute;
    };

}, (2 + random 1), [_unit, _detonateRadius, _activateDistance, _screamingDistance, _time, _markerName]] call CBA_fnc_addPerFrameHandler;
