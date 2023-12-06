#include "..\script_component.hpp"
/*
 * Author: Mike
 * Adds contamination gas within a marker radius.
 * Array returned can be used to clear the gas.
 * Cloud Size cannot be greater than 3.
 *
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Marker <STRING>
 * 1: Colour RGBA <ARRAY> (default: [1, 1, 0, 0.04])
 * 2: Gas cloud size <NUMBER> (default: 1)
 *
 * Return Value:
 * Particle Emitters <ARRAY>
 *
 * Example:
 * ["MyMarker"] call MFUNC(contaminationGas)
 * GVAR(gasOne) = ["MyMarker", [1, 1, 1, 0.04]] call MFUNC(contaminationGas)
 */

params ["_marker", ["_colour", [1, 1, 0, 0.04]], ["_cloudSize", 1]];

// Marker shape should always be either "RECTANGLE" or "ELLIPSE"
if (markerShape _marker == "") exitWith {
    WARNING_1("Marker (%1) does not exist!",_marker);
};

// Limit cloud size to 3 or less.
if (_cloudSize > 3) then {
    WARNING_1("Cloud Size (%1) too large, reverting to maximum value (3)",_cloudSize);
    _cloudSize = 3;
};

private _markerSize = selectMax (getMarkerSize _marker);
private _position = getMarkerPos _marker;
private _fog1 = "#particlesource" createVehicleLocal _position;
private _fog2 = "#particlesource" createVehicleLocal _position;
private _fog3 = "#particlesource" createVehicleLocal _position;

{
    _x setParticleParams [
    ["\A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 12, 13, 0], "", "Billboard", 1, 10,
        [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
        [7,6], [[1, 1, 1, 0], _colour, [1, 1, 1, 0]], [1000], 1, 0, "", "", _x
    ];
    _x setParticleRandom [4, [55, 55, 0.2], [0, 0, -0.1], 2, _cloudSize, [0, 0, 0, 0.1], 0, 0];
    _x setParticleCircle [_markerSize, [0, 0, -0.12]];
    _x setDropInterval 0.035;
} forEach [_fog1, _fog2, _fog3];

if (_markerSize > 60) then {
    WARNING_1("Marker size (%1) larger than recommended size (60x60)!",_markerSize);
};

[_fog1, _fog2, _fog3]
