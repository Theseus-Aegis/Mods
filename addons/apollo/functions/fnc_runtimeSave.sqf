#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Keeps a disconnecting player's state for the rest of the mission (server memory only), so a reconnect puts them
 * back as they were: team (colour, in whichever group they join), vehicle and seat, ACE medical state, radio settings and ACE scope dials
 * (FUNC(runtimeApply)).
 * Cleared at death, so a respawn starts fresh. Rewritten from the apollo-back-to-vehicle branch.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, "76561198000000000"] call tac_apollo_fnc_runtimeSave
 *
 * Public: No
 */

params ["_unit", "_uid"];

if (!alive _unit || {_uid == ""}) exitWith {
    GVAR(playerRuntimeData) deleteAt _uid;
};

private _vehicle = objectParent _unit;
private _seat = [];
if (!isNull _vehicle) then {
    _seat = switch (true) do {
        case (driver _vehicle == _unit): {["driver"]};
        case ((_vehicle unitTurret _unit) isNotEqualTo []): {["turret", _vehicle unitTurret _unit]};
        default {["cargo", _vehicle getCargoIndex _unit]};
    };
};

private _medical = "";
if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
    _medical = [_unit] call ACEFUNC(medical,serializeState);
};

(_unit getVariable [QGVAR(clientState), []]) params ["", ["_radios", []], ["_dials", []]];

GVAR(playerRuntimeData) set [_uid, [assignedTeam _unit, _vehicle, _seat, _medical, _radios, _dials]];
TRACE_2("Runtime Save",_uid,GVAR(playerRuntimeData) get _uid);
