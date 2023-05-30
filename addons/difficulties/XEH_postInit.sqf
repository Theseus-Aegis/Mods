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
        _unit setSkill ["aimingAccuracy", (_unit getVariable QGVAR(originalAccuracy))];
        _unit setVariable [QGVAR(skillFactorSet), false];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Tank", "init", {
    [_this select 0] call FUNC(setAccuracySkill)
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Tank", "seatSwitched", {
    params ["_vehicle", "_unit1", "_unit2"];
    private _roleOne = assignedVehicleRole _unit1 select 0;
    private _roleTwo = assignedVehicleRole _unit2 select 0;
    if (_roleOne == "turret" || _roleTwo == "turret") then {
        [_vehicle] call FUNC(setAccuracySkill);
    };
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
        _unit setSkill ["aimingAccuracy", (_unit getVariable QGVAR(originalAccuracy))];
        _unit setVariable [QGVAR(skillFactorSet), false];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "init", {
    [_this select 0] call FUNC(setAccuracySkill)
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Wheeled_APC_F", "seatSwitched", {
    params ["_vehicle", "_unit1", "_unit2"];
    private _roleOne = assignedVehicleRole _unit1 select 0;
    private _roleTwo = assignedVehicleRole _unit2 select 0;
    if (_roleOne == "turret" || _roleTwo == "turret") then {
        [_vehicle] call FUNC(setAccuracySkill);
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;
