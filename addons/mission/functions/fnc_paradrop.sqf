#include "..\script_component.hpp"
/*
 * Author: Mike
 * Orders a vehicle to paradrop units inside cargo slots, will replace backpacks with parachutes.
 *
 * Call from vehicle waypoint.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Vehicle] call tac_mission_fnc_paradrop
 */

params ["_vehicle"];

if (!is3DENPreview && {!isServer}) exitWith {};

private _crew = fullCrew [_vehicle, "cargo", false];
_crew = _crew select {(_x select 3) isEqualTo []}; // Remove any units with a turret selection
private _filteredCrew = _crew apply {_x select 0}; // Filter to units

{
    [{
        removeBackpack _this;
        _this addBackpack "B_Parachute";
        [_this] allowGetIn false;
        unassignVehicle _this;
        moveOut _this;
    }, _x, _forEachIndex * 1] call CBA_fnc_waitAndExecute;
} forEach _filteredCrew;

