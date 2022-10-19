#include "..\script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Modified version of mortarStrike for use with CUP D30 Artillery.
 *
 * Orders D30 to fire on an area.
 * If amount fired is 0 the amount is randomly selected between 1-8
 * Marker array can be set in init.sqf (See Example 2)
 * Marker array is randomly selected but all rounds fire on the same marker.
 * Ammo types are listed as HE (0), Cluster Smoke (1), Illumination (2).
 * Note that smoke and illumination rounds do not have whistling sound effects.
 * Barrage will have mortars select a new target for every round fired.
 * Do not use more than 3 cluster smoke rounds or graphics will cut smoke effects.
 * 1 Barrage will fire all shells at 1 target.
 *
 * Arguments:
 * 0: D30 <OBJECT>
 * 1: Marker Array <ARRAY>
 * 2: Amount <NUMBER>
 * 3: Ammo Type <NUMBER>
 * 4: Barrages <NUMBER>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [D30_1, ["Marker1", "Marker2"], 0, 0, 2] call TAC_Mission_fnc_d30Strike;
 * [D30_1, tac_MarkerArray, 0, 0, 1] call TAC_Mission_fnc_d30Strike;
 */

#define AMMO_TYPES ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"]
#define FIREMISSION_DELAY 3

params ["_mortar", "_markersArray", ["_amount", 0], ["_ammoType", 0], ["_barrages", 1]];

private _ammo = AMMO_TYPES select _ammoType;

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
