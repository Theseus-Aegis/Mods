#include "..\script_component.hpp"
/*
 * Author: Mike
 * Sets up targeting zone and calls in Rocket Artillery (230mm Rockets).
 * Call on the server.
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
    ["tac_mission_dialogue", ["Purple Rain", "There's no Rocket Artillery crews assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
    ["tac_mission_playSoundUI", [QGVAR(noRocket)], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(rocketBusy)) exitWith {
    ["tac_mission_dialogue", ["Purple Rain", "Rocket Artillery is rearming, give it some time.",  "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
    ["tac_mission_playSoundUI", [QGVAR(rearmingRocket)], _unit] call CBA_fnc_targetEvent;
};

// Randomly pick instead of closest as it's range is insane (closest could also give issues)
private _rocketPiece = selectRandom GVAR(rocketList);

if !(_position inRangeOfArtillery [[_rocketPiece], _ammoToFire]) exitWith {
    ["tac_mission_dialogue", ["Purple Rain", "That area is out of range", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
    ["tac_mission_playSoundUI", [QGVAR(outOfRangeRocket)], _unit] call CBA_fnc_targetEvent;
};

GVAR(rocketBusy) = true;
publicVariable QGVAR(rocketBusy);

[{
    params ["_unit"];
    GVAR(rocketBusy) = false;
    publicVariable QGVAR(rocketBusy);
    ["Purple Rain", "Rocket Artillery support is available."] call tac_mission_fnc_dialogue;
    ["tac_mission_playSoundUI", [QGVAR(availableRocket)], _unit] call CBA_fnc_targetEvent;
}, [_unit], GVAR(rocketDelay)] call CBA_fnc_waitAndExecute;

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
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target", _roundsToFire, _eta];
    ["tac_mission_dialogue", ["Purple Rain", _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
    ["tac_mission_playSoundUI", [QGVAR(incomingRocket)], _unit] call CBA_fnc_targetEvent;

    deleteMarker _marker
}, [_rocketPiece, _roundsToFire, _eta, _unit, _marker], 4] call CBA_fnc_waitAndExecute;
