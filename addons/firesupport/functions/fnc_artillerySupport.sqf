#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles Artillery calls and firing
 * Call on the server
 *
 * Arguments:
 * 0: Support Type <NUMBER>
 * 1: Position of fired projectile <ARRAY>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(artillerySupport);
 */

params ["_supportType", "_position", "_unit"];

private _ammoToFire = GVAR(artilleryAmmoTypes) select _supportType;

if (GVAR(artilleryList) isEqualTo []) exitWith {
    ["tac_mission_dialogue", ["Knight", "No Artillery Crews Assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(artilleryBusy)) exitWith {
    ["tac_mission_dialogue", ["Knight", "Artillery crews are rearming, give it some time.",  "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Randomly pick instead of closest as it's range is insane (closest could also give issues)
private _artilleryPiece = selectRandom GVAR(artilleryList);

if !(_position inRangeOfArtillery [[_artilleryPiece], _ammoToFire]) exitWith {
    ["tac_mission_dialogue", ["Knight", "Artillery is not in range of target", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

GVAR(artilleryBusy) = true;
publicVariable QGVAR(artilleryBusy);

[{
    GVAR(artilleryBusy) = false;
    publicVariable QGVAR(artilleryBusy);
    ["Knight", "Artillery support is available."] call tac_mission_fnc_dialogue;
}, [], GVAR(artilleryDelay)] call CBA_fnc_waitAndExecute;

private _markerName = format ["Artillery_Target_%1", _position];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _position;
_marker setMarkerSizeLocal GVAR(artilleryAreaSize);

private _roundsToFire = GVAR(artilleryRoundCount);
if (_roundsToFire == 0) then {
    _roundsToFire = floor (random 8 + 1);
};

// Due to Arma limitations with smoke, 2 should be the maximum fired for artillery.
if (_supportType == 1) then {
    _roundsToFire = _roundsToFire max 2;
};

[_artilleryPiece, _marker, _roundsToFire, _ammoToFire, 10] call FUNC(doArtilleryFire) params ["_eta"];

[{
    params ["_artilleryPiece", "_roundsToFire", "_eta", "_unit", "_marker"];
    private _teamName = format ["%1", _artilleryPiece getVariable [QGVAR(artilleryName), "Titan"]];
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target", _roundsToFire, _eta];

    ["tac_mission_dialogue", [_teamName, _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;

    deleteMarker _marker
}, [_artilleryPiece, _roundsToFire, _eta, _unit, _marker], 4] call CBA_fnc_waitAndExecute;
