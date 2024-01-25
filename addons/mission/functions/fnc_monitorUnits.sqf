#include "..\script_component.hpp"
/*
 * Author: Mike
 * Used to check AI count from Debug watch field.
 * Call from Debug watch field
 *
 * Use 0 for general unit counting
 * Use 1 for Active, Inactive, Hunt groups & Agents unit counting
 *
 * Arguments:
 * 0: Count Type (default: 0)
 *
 * Return Value:
 * Report <STRING>
 *
 * Example:
 * [0] call MFUNC(monitorUnits)
 */

params [["_type", 0]];

switch (_type) do {
    case 0: {
        private _west = (west countSide allUnits) - (west countSide playableUnits);
        private _east = (east countSide allUnits) - (east countSide playableUnits);
        private _resistance = (resistance countSide allUnits) - (resistance countSide playableUnits);
        private _civilian = (civilian countside allUnits) - (civilian countSide playableUnits);
        format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5|FPS: %6", _west, _east, _resistance , _civilian, count playableUnits, diag_fps]
    };
    case 1: {
        private _active = count (allUnits select {simulationEnabled _x}) - count playableUnits;
        private _inactive = count (allUnits select {!simulationEnabled _x});
        private _huntGroups = [count GVAR(huntGroups), "N/A"] select (isServer);
        format ["Active: %1|Inactive: %2|Hunt Groups: %3|Agents: %4", _active, _inactive, _huntGroups, count agents]
    };
};
