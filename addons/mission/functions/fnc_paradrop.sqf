#include "..\script_component.hpp"
/*
 * Author: Mike
 * Orders a vehicle to paradrop units inside cargo slots and optionally Turrets.
 * It's not foolproof as sometimes the "turret" selections can include co-pilots.
 * Replaces backpacks of units dropping with parachutes.
 *
 * Call from vehicle waypoint.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Include Turrets <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [Vehicle] call tac_mission_fnc_paradrop
 */

params ["_vehicle", ["_includeTurrets", true]];

if (!local _vehicle) exitWith {};

private _crew = fullCrew [_vehicle, "cargo", false];
_crew = _crew select {(_x select 3) isEqualTo []}; // Remove any units with a turret selection

private _filteredCrew = _crew apply {_x select 0};

if (_includeTurrets) then {
    private _turrets = fullCrew [_vehicle, "turret", false];
    private _filteredTurrets = _turrets apply {_x select 0};
    _filteredCrew append _filteredTurrets;
};

{
    [{
        removeBackpack _this;
        _this addBackpack "B_Parachute";
        [_this] allowGetIn false;
        unassignVehicle _this;
        moveOut _this;
    }, _x, _forEachIndex * 1] call CBA_fnc_waitAndExecute;
} forEach _filteredCrew;
