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
        format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", west countSide allUnits, east countSide allUnits, resistance countside allUnits, civilian countSide allUnits, count playableUnits]
    };
    case 1: {
        format ["Active: %1|Inactive: %2|Agents: %3|FPS: %4", count (allUnits select {simulationEnabled _x}), count (allUnits select {!simulationEnabled _x}), count agents, diag_fps]
    };
};
