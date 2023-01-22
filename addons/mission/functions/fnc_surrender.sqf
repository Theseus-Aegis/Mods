#include "script_component.hpp"
/*
 * Author: Mike
 * Random chance of an enemy surrendering when being suppressed.
 * Fires everytime a bullet passes close to an enemy.
 * Call from init.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Chance <NUMBER> (default: 5)
 * 2: Distance <NUMBER> (default: 400)
 * 3: Rally Chance <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group, 50] call MFUNC(surrender)
 */

params ["_group", ["_chance", 5], ["_distance", 400], ["_rally", 0]];

_group setVariable [QGVAR(surrenderParams), [_chance, _distance, _rally], true];

{
    _x addEventHandler ["Suppressed", {
        params ["_unit", "", "_shooter"];

        (group _unit getVariable [QGVAR(surrenderParams), 0]) params ["_chance", "_distance", "_rally"];
        private _randomChance = round random 100;
        private _rallyChance = round random 100;

        // Distance checks
        private _distanceCheck = _unit distance2d _shooter;

        if (_distanceCheck <= _distance) then {
            // If the random number is lower than the chance of surrender it passes.
            if (_randomChance < _chance) then {
                ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;

                // If units are going to Rally don't remove EH.
                if (_rallyChance >= _rally) then {
                    _unit removeEventHandler [_thisEvent, _thisEventHandler];
                };

                if (_rallyChance < _rally) then {
                    [{
                        params ["_unit"];
                        ["ACE_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
                    }, [_unit], (random 110) + 10] call CBA_fnc_waitAndExecute;
                };
            };
        };
    }];
} forEach units _group;
