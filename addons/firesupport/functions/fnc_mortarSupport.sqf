#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles mortar calls and firing
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
 * [] call FUNC(mortarSupport);
 */

params ["_supportType", "_position", "_unit"];

private _ammoToFire = GVAR(mortarAmmoTypes) select _supportType;

if (GVAR(mortarList) isEqualTo []) exitWith {
    ["tac_mission_dialogue", ["Knight", "No Mortar Crews Assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(mortarsBusy)) exitWith {
    ["tac_mission_dialogue", ["Knight", "Mortar crews are rearming, give it some time.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Sort by distance, Don't overwrite or it'll error on next run.
private _mortarList = GVAR(mortarList) apply {[_x distance2D _position, _x]};
_mortarList sort true;

private _inRange = _mortarList findIf {_position inRangeOfArtillery [[_x select 1], _ammoToFire]};
if (_inRange == -1) exitWith {
    ["tac_mission_dialogue", ["Knight", "No mortars in range of area.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Only allow one fire mission until delay has passed.
GVAR(mortarsBusy) = true;
publicVariable QGVAR(mortarsBusy);

[{
    GVAR(mortarsBusy) = false;
    publicVariable QGVAR(mortarsBusy);
    ["Knight", "Mortar support is available."] call tac_mission_fnc_dialogue;
}, [], GVAR(mortarDelay)] call CBA_fnc_waitAndExecute;

private _mortarInRange = (_mortarList select _inRange) select 1;

private _markerName = format ["Mortar_Target_%1", _position];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _position;
_marker setMarkerSizeLocal GVAR(mortarAreaSize);

// Forces mortar to face direction to prevent weird delays
private _direction = _mortarInRange getDir (getMarkerPos _marker);
["tac_mission_setDir", [_mortarInRange, _direction], _mortarInRange] call CBA_fnc_targetEvent;

private _roundsToFire = GVAR(mortarRoundCount);
if (_roundsToFire == 0) then {
    _roundsToFire = floor (random 8 + 1);
};

// Due to Arma limitations with smoke, 4 should be the maximum fired for mortars.
if (_supportType == 1) then {
    _roundsToFire = _roundsToFire max 4;
};

[_mortarInRange, _marker, _roundsToFire, _ammoToFire, 2.5] call FUNC(doArtilleryFire) params ["_eta"];

[{
    params ["_mortarInRange", "_roundsToFire", "_eta", "_unit", "_marker"];
    private _teamName = format ["%1", _mortarInRange getVariable [QGVAR(mortarName), "Templar"]];
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target", _roundsToFire, _eta];

    ["tac_mission_dialogue", [_teamName, _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;

    deleteMarker _marker
}, [_mortarInRange, _roundsToFire, _eta, _unit, _marker], 4] call CBA_fnc_waitAndExecute;
