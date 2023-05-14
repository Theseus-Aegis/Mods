#include "script_component.hpp"
/*
 * Author: Kaysi, Kresky, Jonpas, Mike
 * Adds ground fog.
 *
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Colour RGBA <ARRAY>
 * 2: Condition <CODE> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player] call MFUNC(groundFog)
 * [_player, [1, 1, 1, 0.04], {TAC_Example}] call MFUNC(groundFog)
 */

params ["_player", ["_colour", [1, 1, 1, 0.04]], ["_condition", {true}]];

if (_player getVariable [QGVAR(groundFogLastChange), -1] < CBA_missionTime) then {
    _player setVariable [QGVAR(groundFogLastChange), CBA_missionTime + 5];

    private _vehicleCheck = vehicle _player == _player;
    private _obj = [_player, vehicle _player] select (_vehicleCheck);
    private _pos = position _obj;
    private _fog1 = "#particlesource" createVehicleLocal _pos;
    private _fog2 = "#particlesource" createVehicleLocal _pos;
    private _fog3 = "#particlesource" createVehicleLocal _pos;

    {
        _x setParticleParams [
        ["\A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 12, 13, 0], "", "Billboard", 1, 10,
            [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
            [7,6], [[1, 1, 1, 0], _colour, [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
        ];
        _x setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
        _x setParticleCircle [0.001, [0, 0, -0.12]];
        _x setDropInterval 0.035;
    } forEach [_fog1, _fog2, _fog3];

    private _refresh = [5, 30] select _vehicleCheck;
    [{
        params ["_fog1", "_fog2", "_fog3", "_player", "_colour", "_condition", "_refresh"];
        {deleteVehicle _x} forEach [_fog1, _fog2, _fog3];

        if (_condition) then {
            [_player, _colour, _condition] call FUNC(groundFog);
        };
    }, [_fog1, _fog2, _fog3, _player, _colour, _condition, _refresh], _refresh] call CBA_fnc_waitAndExecute;
};
