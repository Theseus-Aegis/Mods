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
 *
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
 * [Mortar1, ["Marker1", "Marker2"], 0, 0, 2] call TAC_Mission_fnc_mortarStrike;
 * [Mortar1, tac_MarkerArray, 0, 0, 1] call TAC_Mission_fnc_mortarStrike;
 */

#define AMMO_TYPES ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"]
#define FIREMISSION_DELAY 2

params ["_mortar", "_markersArray", ["_amount", 0], ["_ammoType", 0], ["_barrages", 1]];

private _ammo = AMMO_TYPES select _ammoType;

// Debug
//diag_log [_mortar, _randomPosition, _ammo, _amount];

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
    }, [_mortar, _randomPosition, _ammo, _amount], _i * FIREMISSION_DELAY] call CBA_fnc_waitAndExecute;
};
