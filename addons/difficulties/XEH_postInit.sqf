#include "script_component.hpp"

["Tank", "getIn", {
    params ["_vehicle", "_role"];
    if (_role != "gunner") exitWith {};
    [_vehicle] call FUNC(setAccuracySkill);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Tank", "getOut", {
    params ["", "_role", "_unit"];
    if (_role != "gunner") exitWith {};
    if (_unit getVariable [QGVAR(skillFactorSet), false]) then {
        _unit setAccuracySkill ["aimingAccuracy", 0.5];
        _unit setVariable [QGVAR(skillFactorSet), false];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Tank", "init", {
    [_this select 0] call FUNC(setAccuracySkill)
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "getIn", {
    params ["_vehicle", "_role"];
    if (_role != "gunner") exitWith {};
    [_vehicle] call FUNC(setAccuracySkill);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "getOut", {
    params ["", "_role", "_unit"];
    if (_role != "gunner") exitWith {};
    if (_unit getVariable [QGVAR(skillFactorSet), false]) then {
        _unit setAccuracySkill ["aimingAccuracy", 0.5];
        _unit setVariable [QGVAR(skillFactorSet), false];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "init", {
    [_this select 0] call FUNC(setAccuracySkill)
}, true, [], true] call CBA_fnc_addClassEventHandler;

