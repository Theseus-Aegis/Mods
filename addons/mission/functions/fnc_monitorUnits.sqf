#include "script_component.hpp"
/*
 * Author: Mike
 * Used to check AI count from Debug watch field.
 * Call from Debug watch field
 *
 * Use 0 for general unit counting
 * Use 1 for Active, Inactive & Agents unit counting
 *
 * Arguments:
 * 0: Count Type (default: 0)
 *
 * Return Value:
 * Report <STRING>
 *
 * Example:
 * [0] call TAC_Mission_fnc_monitorUnits
 */

params [["_type", 0]];

switch (_type) do {
    case 0: {
        private _west = west countSide allUnits - playableUnits;
        private _east = east countSide allUnits - playableUnits;
        private _resistance = resistance countSide allUnits - playableUnits;
        private _civilian = civilian countside allUnits - playableUnits;
        format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", _west, _east, _resistance , _civilian, count playableUnits]
    };
    case 1: {
        private _active = count (allUnits - playableUnits select {simulationEnabled _x});
        private _inactive = count (allUnits select {!simulationEnabled _x});
        format ["Active: %1|Inactive: %2|Agents: %3|FPS: %4", _active, _inactive, count agents, diag_fps]
    };
};
