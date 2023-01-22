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
 * 3: Rally <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group, 50] call MFUNC(surrender)
 */

params ["_group", ["_chance", 5], ["_distance" 400], ["_rally", true]];

_group setVariable [QGVAR(surrenderChance), _chance, true];
_group setVariable [QGVAR(surrenderDistance), _distance, true];
_group setVariable [QGVAR(surrenderRally), _rally, true];

{
    _x addEventHandler ["Suppressed", {
        params ["_unit", "", "_shooter"];

        private _chance = group _unit getVariable [QGVAR(surrenderChance), 0];
        private _distance = group _unit getVariable [QGVAR(surrenderDistance), 0];
        private _rally = group _unit getVariable [QGVAR(surrenderRally), true];
        private _randomChance = round random 100;

        // Distance checks
        private _distanceCheck = _unit distance2d _shooter;

        if (_distanceCheck <= _distance) then {
            // If the random number is lower than the chance of surrender it passes.
            if (_randomChance < _chance) then {
                ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;

                // If units are going to Rally don't remove EH.
                if (!_rally) then {
                    _unit removeEventHandler [_thisEvent, _thisEventHandler];
                };

                if (_rally && {_unit getVariable ["ACE_Captives_isSurrendering", false]}) then {
                    [{
                        params ["_unit"];
                        ["ACE_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
                        private _unitGroup = group unit;
                    }, [_unit, _chance, _distance, _rally], (round random 120) max 10] call CBA_fnc_waitAndExecute;
                };
            };
        };
    }];
} forEach units _group;
