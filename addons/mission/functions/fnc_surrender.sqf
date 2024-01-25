#include "..\script_component.hpp"
/*
 * Author: Mike
 * Random chance of an enemy surrendering when being suppressed.
 * Fires everytime a bullet passes close to an enemy.
 * Call from init.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Surrender Chance <NUMBER> (default: 5)
 * 2: Distance <NUMBER> (default: 400)
 * 3: Rally Chance <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Group, 50] call MFUNC(surrender)
 */

params ["_group", ["_surrenderChance", 5], ["_minimumDistance", 400], ["_rallyChance", 0]];

if (_group isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows group, detected unit.");
};

_group setVariable [QGVAR(surrenderParams), [_surrenderChance, _minimumDistance, _rallyChance], true];

{
    _x addEventHandler ["Suppressed", {
        params ["_unit", "", "_shooter"];

        (group _unit getVariable [QGVAR(surrenderParams), 0]) params ["_surrenderChance", "_minimumDistance", "_rallyChance"];

        // Distance Check, no point continuing if distance has failed.
        private _distanceCheck = (_unit distance2d _shooter) > _minimumDistance;
        if (!_distanceCheck) exitWith {};

        // % chance of surrendering and rallying.
        private _willSurrender = random 100 < _surrenderChance;
        private _willRally = random 100 < _rallyChance;

        if (_willSurrender) then {
            ["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
            ["ocap_customEvent", ["generalEvent", format ["%1 has Surrendered!", name _unit]]] call CBA_fnc_serverEvent;

            // If unit is going to rally, delay and un-surrender, else remove eventhandler.
            if (_willRally) then {
                [{
                    params ["_unit"];
                    ["ACE_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
                    ["ocap_customEvent", ["generalEvent", format ["%1 has Rallied!", name _unit]]] call CBA_fnc_serverEvent;
                }, [_unit], (random 110) + 10] call CBA_fnc_waitAndExecute;
            } else {
                _unit removeEventHandler [_thisEvent, _thisEventHandler];
            };
        };
    }];
} forEach units _group;
