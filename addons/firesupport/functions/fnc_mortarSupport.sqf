#include "..\script_component.hpp"
/*
 * Author: Mike
 * Mortar support, called via pre-set ammo types, on a custom cooldown after firing.
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
 * [position, unit] call FUNC(mortarSupport);
 */

params ["_position", "_unit"];

// Alter position height to always be 0.
_position set [2, 0];

if (GVAR(mortarList) isEqualTo []) then {
    ["tac_mission_dialogue", ["Knight", "No Mortar crews assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(mortarsBusy)) exitWith {
    ["tac_mission_dialogue", ["Knight", "Mortar crews are rearming, give it some time.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Sort by distance, Don't overwrite or it'll error on next run.
private _mortarList = GVAR(mortarList) apply {[_x distance2D _position, _x]};
_mortarList sort true;

private _inRange = _mortarList findIf {_position inRangeOfArtillery [[_x select 1], "8Rnd_82mm_Mo_shells"]};

if (_inRange == -1) exitWith {
    ["tac_mission_dialogue", ["Knight", "No mortars in range of area.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Only allow one fire mission until delay has passed.
GVAR(mortarsBusy) = true;
publicVariable QGVAR(mortarsBusy);

private _mortarInRange = (_mortarList select _inRange) select 1;

private _markerName = format ["Mortar_Target_%1", _position];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _position;
_marker setMarkerSizeLocal GVAR(areaSize);

[{
    params ["_mortarInRange", "_marker", "_inRange", "_unit"];

    // Fire Mortars
    private _mortarFired = ([_mortarInRange, [_marker], GVAR(roundCount), 0] call tac_mission_fnc_mortarStrike) params ["_eta", "_rounds"];

    private _teamName = format ["%1", _mortarInRange getVariable [QGVAR(mortarName), "Templar"]];
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target.", _rounds, _eta];
    ["tac_mission_dialogue", [_teamName, _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;

    deleteMarkerLocal _marker;
}, [_mortarInRange, _marker, _inRange, _unit], 4] call CBA_fnc_waitAndExecute;

[{
    GVAR(mortarsBusy) = false;
    publicVariable QGVAR(mortarsBusy);
}, [], GVAR(delay)] call CBA_fnc_waitAndExecute;
