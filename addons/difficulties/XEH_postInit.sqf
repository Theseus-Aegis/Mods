#include "script_component.hpp"

["CAManBase", "Init", {
    params ["_unit"];
    if (vehicle _unit != _unit && {gunner (vehicle _unit) == _unit}) then {
        [_unit] call FUNC(setUnitAccuracy);
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

private _getInHandler = {
    params ["", "_role", "_unit"];
    if (_role == "gunner") then {
        [_unit] call FUNC(setUnitAccuracy);
    };
};
private _getOutHandler = {
    params ["", "_role", "_unit"];
    if (_role == "gunner") then {A
        [_unit, true] call FUNC(setUnitAccuracy);
    };
};
private _seatSwitchedHandler = {
    params ["_vehicle", "_unit1", "_unit2"];

    private _currentGunner = objNull; // find current gunner if any
    {
        if (gunner (vehicle _x) == _x) then {
            _currentGunner = _x;
        };
    } forEach [_unit1, _unit2];

    if (!isNull _currentGunner) then { // did gunner switch the seat even?
        private _previousGunner = [_unit1, _unit2] select (_unit2 == _currentGunner); // previous gunner must be the other unit

        [_currentGunner] call FUNC(setUnitAccuracy);
        [_previousGunner, true] call FUNC(setUnitAccuracy);
    };
};

["Tank", "GetIn", _getInHandler, true, []] call CBA_fnc_addClassEventHandler;
["Tank", "GetOut", _getOutHandler, true, []] call CBA_fnc_addClassEventHandler;
["Tank", "SeatSwitched", _seatSwitchedHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "GetIn", _getInHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "GetOut", _getOutHandler, true, []] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "SeatSwitched", _seatSwitchedHandler, true, []] call CBA_fnc_addClassEventHandler;
