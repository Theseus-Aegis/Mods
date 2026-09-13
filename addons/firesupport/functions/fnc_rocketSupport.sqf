#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles Artillery calls and firing
 * Call on the server
 *
 * Arguments:
 * 0: Position of fired projectile <ARRAY>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(rocketSupport);
 */

params ["_position", "_unit"];

private _ammoToFire = GVAR(rocketAmmoTypes) select 0;

if (GVAR(rocketList) isEqualTo []) exitWith {
    ["tac_mission_dialogue", ["Knight", "No Rocket Crews Assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(rocketBusy)) exitWith {
    ["tac_mission_dialogue", ["Knight", "Rocket crews are rearming, give it some time.",  "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Randomly pick instead of closest as it's range is insane (closest could also give issues)
private _rocketPiece = selectRandom GVAR(rocketList);

if !(_position inRangeOfArtillery [[_rocketPiece], _ammoToFire]) exitWith {
    ["tac_mission_dialogue", ["Knight", "Rocket is not in range of target", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

GVAR(rocketBusy) = true;
publicVariable QGVAR(rocketBusy);

[{
    GVAR(rocketBusy) = false;
    publicVariable QGVAR(rocketBusy);
    ["Knight", "Rocket support is available."] call tac_mission_fnc_dialogue;
}, [], GVAR(rocketDelay)] call CBA_fnc_waitAndExecute;

private _markerName = format ["Rocket_Target_%1", _position];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _position;
_marker setMarkerSizeLocal GVAR(rocketAreaSize);

private _roundsToFire = GVAR(rocketRoundCount);
if (_roundsToFire == 0) then {
    _roundsToFire = floor (random 8 + 1);
};

[_rocketPiece, _marker, _roundsToFire, _ammoToFire, 10] call FUNC(doArtilleryFire) params ["_eta"];

[{
    params ["_rocketPiece", "_roundsToFire", "_eta", "_unit", "_marker"];
    private _teamName = format ["%1", _rocketPiece getVariable [QGVAR(rocketName), "Odin"]];
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target", _roundsToFire, _eta];

    ["tac_mission_dialogue", [_teamName, _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;

    deleteMarker _marker
}, [_rocketPiece, _roundsToFire, _eta, _unit, _marker], 4] call CBA_fnc_waitAndExecute;
