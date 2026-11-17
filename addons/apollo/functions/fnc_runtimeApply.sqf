#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts a reconnecting player back as they were (see FUNC(runtimeSave)): into their vehicle (the same seat, else any
 * free one, else they stay where they loaded, by the vehicle), their team, ACE medical state and radio settings.
 * Run where the player is local, after their load.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Team <STRING>
 * 2: Vehicle <OBJECT>
 * 3: Seat ([] none, ["driver"], ["turret", path], ["cargo", index]) <ARRAY>
 * 4: ACE medical state (serializeState) <STRING>
 * 5: Radio settings (FUNC(getRadios)) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "MAIN", vehicle, ["cargo", 2], "", []] call tac_apollo_fnc_runtimeApply
 *
 * Public: No
 */

params ["_player", "_team", "_vehicle", "_seat", "_medical", "_radios"];
TRACE_1("Runtime Apply",_this);

if (alive _vehicle && {isNull objectParent _player}) then {
    _seat params [["_role", ""], ["_where", -1]];
    switch (_role) do {
        case "driver": { _player moveInDriver _vehicle; };
        case "turret": { _player moveInTurret [_vehicle, _where]; };
        case "cargo": { _player moveInCargo [_vehicle, _where]; };
    };
    // The seat was taken: any free one
    [{
        params ["_player", "_vehicle"];
        if (isNull objectParent _player && {alive _vehicle}) then {
            _player moveInAny _vehicle;
        };
    }, [_player, _vehicle], 0.5] call CBA_fnc_waitAndExecute;
};

if (_team != "") then {
    _player assignTeam _team;
};

if (_medical != "" && {["ace_medical"] call ACEFUNC(common,isModLoaded)}) then {
    [_player, _medical] call ACEFUNC(medical,deserializeState);
};

[_radios] call FUNC(setRadios);
