#include "..\script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Orders mortars to fire on an area.
 * If amount fired is 0 the amount is randomly selected between 1-8
 * Markers must be either Area Markers (Ellipse or Rectangle)
 * Marker array can be set in init.sqf (See Example 2)
 * Marker array is randomly selected but all rounds fire on the same marker.
 * Ammo types are listed as HE (0), Smoke (1), Ilumination (2)
 * Barrage will have mortars select a new target for every round fired.
 * 1 Barrage will fire all shells at 1 target.
 * Using this script requires "force ace_mk6mortar_useAmmoHandling = false;" in cba_settings.sqf
 * This function also covers the use of CUP D30 Artillery.
 *
 * Arguments:
 * 0: Mortar <OBJECT>
 * 1: Marker Array <ARRAY>
 * 2: Amount <NUMBER>
 * 3: Ammo Type <NUMBER>
 * 4: Barrages <NUMBER>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [Mortar1, ["Marker1", "Marker2"], 0, 0, 2] call MFUNC(mortarStrike)
 * [Mortar1, tac_MarkerArray, 0, 0, 1] call MFUNC(mortarStrike)
 */

params ["_mortar", "_markersArray", ["_amount", 0], ["_ammoType", 0], ["_barrages", 1]];

// Default types and delay are designed for the MK6 Mortar.
private _ammoTypes = ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
private _delay = 2;

// D30 Artillery types
if (_mortar isKindOf "CUP_D30_base") then {
    _ammoTypes = ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"];
    _delay = 5;
};

private _ammo = _ammoTypes select _ammoType;

// Debug
//diag_log [_mortar, _randomPosition, _ammo, _amount];
if (ace_mk6mortar_useAmmoHandling) exitWith {
    WARNING("ACE Ammo Handling setting is enabled.");
};

if (_barrages < 1) exitWith {
    WARNING_1("Barrages (%1) cannot be less than 1.",_barrages);
};

private _outOfRange = _markersArray findIf {!((getMarkerPos _x) inRangeOfArtillery [[_mortar], _ammo])};
if (_outOfRange != -1) exitWith {
    WARNING_1("Marker Index: %1 is out of range of Artillery",_outOfRange);
};

for "_i" from 0 to _barrages - 1 do {
    private _randomMarker = selectRandom _markersArray;
    private _randomPosition = [_randomMarker, true] call CBA_fnc_randPosArea;

    if (_amount == 0) then {
        _amount = random 8 + 1;
    };

    [{
        params ["_mortar", "_randomPosition", "_ammo", "_amount"];
        _mortar doArtilleryFire [_randomPosition, _ammo, _amount];
        _mortar setVehicleAmmo 1;
    }, [_mortar, _randomPosition, _ammo, _amount], _i * _delay] call CBA_fnc_waitAndExecute;
};
