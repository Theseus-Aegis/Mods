#include "script_component.hpp"
/*
 * Author: Mike
 * Random chance of an enemy surrendering when being suppressed.
 * Fires everytime a bullet passes close to an enemy.
 * Call from init.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Chance <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group, 50] call MFUNC(surrender)
 */

params ["_group", ["_chance", 10]];

_group setVariable [QGVAR(surrenderChance), _chance, true];

{
    _x addEventHandler ["Suppressed", {
        params ["_unit"];

        private _chance = group _unit getVariable [QGVAR(surrenderChance), 0];
        private _randomChance = round random 100;

        // If the random number is lower than the chance of surrender it passes.
        if (_randomChance < _chance) then {
            ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
            _unit removeEventHandler [_thisEvent, _thisEventHandler];
        };
    }];
} forEach units _group;
