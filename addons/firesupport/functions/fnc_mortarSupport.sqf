#include "..\script_component.hpp"
/*
 * Author: Mike
 * Mortar support, called via Orange smoke (GL or hand thrown), on a 10-15 minute cooldown after firing.
 * Call on the server
 *
 * Arguments:
 * 0: Position of thrown smoke <ARRAY>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [position, unit] call FUNC(mortarSupport);
 */

params ["_position", "_unit"];

if (tac_scripts_mortarList isEqualTo []) then {
    ["tac_mission_dialogue", ["Knight", "No Mortar crews assigned", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

if (GVAR(mortarsBusy)) exitWith {
    ["tac_mission_dialogue", ["Knight", "Mortar crews are keeping a low profile, give it some time.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Sort by distance, Don't overwrite or it'll error on next run.
private _mortarList = tac_scripts_mortarList apply {[_x distance2D _position, _x]};
_mortarList sort true;

private _inRange = _mortarList findIf {_position inRangeOfArtillery [[_x select 1], "8Rnd_82mm_Mo_shells"]};

if (_inRange == -1) exitWith {
    ["tac_mission_dialogue", ["Knight", "No mortars in range of smoke.", "#ffffff", 2], _unit] call CBA_fnc_targetEvent;
};

// Only allow one fire mission every 10-15 minutes.
GVAR(mortarsBusy) = true;
publicVariable QGVAR(mortarsBusy);

private _mortarInRange = (_mortarList select _inRange) select 1;

private _markerName = format ["Mortar_Target_%1", _position];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerPosLocal _position;
_marker setMarkerSizeLocal [35, 35];

[{
    params ["_mortarInRange", "_marker", "_inRange", "_unit"];

    // Fire Mortars
    private _mortarFired = ([_mortarInRange, [_marker], 0, 0] call tac_mission_fnc_mortarStrike) params ["_eta", "_rounds"];

    private _teamName = format ["%1", _mortarInRange getVariable ["tac_scripts_mortarName", "Templar"]];
    private _etaText = format ["Fire for effect, %1 rounds incoming, ETA %2 seconds to target.", _rounds, _eta];
    ["tac_mission_dialogue", [_teamName, _etaText, "#ffffff", 2], _unit] call CBA_fnc_targetEvent;

    deleteMarkerLocal _marker;
}, [_mortarInRange, _marker, _inRange, _unit], 4] call CBA_fnc_waitAndExecute;

[{
    GVAR(mortarsBusy) = false;
    publicVariable QGVAR(mortarsBusy);
}, [], GVAR(delay)] call CBA_fnc_waitAndExecute;
