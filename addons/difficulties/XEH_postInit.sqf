#include "script_component.hpp"

["CAManBase", "Init", {
    params ["_unit"];
    private _vehicle = vehicle _unit;
    if (_vehicle != _unit && {gunner _vehicle == _unit || commander _vehicle == _unit}) then {
        [_unit] call FUNC(setUnitAccuracy);
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

private _getInHandler = {
    params ["", "_role", "_unit"];
    if (_role in ["gunner", "commander"]) then {
        [_unit] call FUNC(setUnitAccuracy);
    };
};
private _getOutHandler = {
    params ["", "_role", "_unit"];
    if (_role in ["gunner", "commander"]) then {A
        [_unit, true] call FUNC(setUnitAccuracy);
    };
};
private _seatSwitchedHandler = {
    params ["_vehicle", "_unit1", "_unit2"];
    {
        private _reset = gunner _vehicle != _x && commander _vehicle != _x;
        [_x, _reset] call FUNC(setUnitAccuracy);
    } forEach [_unit1, _unit2];
};

["Tank", "GetIn", _getInHandler, true, []] call CBA_fnc_addClassEventHandler;
["Tank", "GetOut", _getOutHandler, true, []] call CBA_fnc_addClassEventHandler;
["Tank", "SeatSwitched", _seatSwitchedHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "GetIn", _getInHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "GetOut", _getOutHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "SeatSwitched", _seatSwitchedHandler, true, []] call CBA_fnc_addClassEventHandler;
