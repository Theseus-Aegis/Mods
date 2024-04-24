#include "..\script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Orders mortars to fire on an area. Each round will be fired at a different point on a random marker provided.
 * If amount is 0 then it will choose randomly between 1-8.
 * Ammo types are: HE (0), Smoke (1), Illumination (2)
 * This function also covers the CUP D30 Artillery.
 *
 * Call on the server.
 *
 * Arguments:
 * 0: Mortar <OBJECT>
 * 1: Marker Array <ARRAY>
 * 2: Rounds to fire <NUMBER>
 * 3: Ammo Type <NUMBER>
 *
 * Return Value:
 * 0: ETA (seconds) <NUMBER>
 * 1: Amount <NUMBER>
 *
 * Examples:
 * [My_Mortar, ["My_Marker", "My_Marker_1"], 5, 0] call MFUNC(mortarStrike)
 * [My_Mortar, GVAR(markerArray)] call MFUNC(mortarStrike)
 */

params ["_mortar", "_markersArray", ["_amount", 0], ["_ammoType", 0]];

if (!isServer) exitWith {};

// Force mortar to look in the general direction where it will fire, should eliminate the delay on not firing the first round.
private _dir = _mortar getDir (getMarkerPos (_markersArray select 0));
[QGVAR(setDir), [_mortar, _dir], _mortar] call CBA_fnc_targetEvent;

// MK6 Mortar
private _ammoTypes = ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
private _delay = 2.5;

// D30 Artillery
if (_mortar isKindOf "CUP_D30_base") then {
    _ammoTypes = ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"];
    _delay = 5;
};

private _gunner = gunner _mortar;
private _ammo = _ammoTypes select _ammoType;
private _eta = 0;

// Debug
if (_amount == 0) then {
    _amount = floor (random 8 + 1);
};

// Disable relevant ace setting
if (ace_mk6mortar_useAmmoHandling) exitWith {
    WARNING("ACE Ammo Handling setting is enabled.");
};

// Error on marker being incorrect type
private _invalidMarker = _markersArray findIf {!(markerShape _x in ["RECTANGLE", "ELLIPSE"])};
if (_invalidMarker != -1) exitWith {
    private _failedMarker = _markersArray select _invalidMarker;
    ERROR_MSG_1("Marker: %1 is not an area marker (rectangle or ellipse)",_failedMarker);
};

// Warn on first out of range marker found
private _outOfRange = _markersArray findIf {!((getMarkerPos _x) inRangeOfArtillery [[_mortar], _ammo])};
if (_outOfRange != -1) exitWith {
    WARNING_1("Marker Index: %1 is out of range of Artillery",_outOfRange);
};

for "_i" from 0 to _amount - 1 do {
    private _marker = selectRandom _markersArray;
    private _position = [_marker, true] call CBA_fnc_randPosArea;
    _eta = round (_mortar getArtilleryETA [_position, _ammo]);
    [{
        params ["_mortar", "_position", "_ammo", "_gunner"];
        [QGVAR(doArtilleryFire), [_gunner, [_position, _ammo, 1]], _gunner] call CBA_fnc_targetEvent;
        [QGVAR(setVehicleAmmo), [_mortar, 1], _mortar] call CBA_fnc_targetEvent;
    }, [_mortar, _position, _ammo, _gunner], _i * _delay] call CBA_fnc_waitAndExecute;
};

[_eta, _amount]
