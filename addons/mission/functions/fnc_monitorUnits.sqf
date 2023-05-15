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
 * [0] call MFUNC(monitorUnits)
 */

params [["_type", 0]];

switch (_type) do {
    case 0: {
        private _playersWest = count (playableUnits select {(side _x) == west});
        private _playersEast = count (playableUnits select {(side _x) == east});
        private _playersResistance = count (playableUnits select {(side _x) == resistance});
        private _playersCivilian = count (playableUnits select {(side _x) == civilian});

        private _west = (west countSide allUnits) - _playersWest;
        private _east = (east countSide allUnits) - _playersEast;
        private _resistance = (resistance countSide allUnits) - _playersResistance;
        private _civilian = (civilian countside allUnits) - _playersCivilian;
        format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", _west, _east, _resistance , _civilian, count playableUnits]
    };
    case 1: {
        private _active = count (allUnits select {simulationEnabled _x}) - count playableUnits;
        private _inactive = count (allUnits select {!simulationEnabled _x});
        format ["Active: %1|Inactive: %2|Agents: %3|FPS: %4", _active, _inactive, count agents, diag_fps]
    };
};
