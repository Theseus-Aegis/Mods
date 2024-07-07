#include "..\script_component.hpp"
/*
 * Author: Mike
 * Simulates the vehicle being degraded by failing to start or breaking down at certain speeds.
 * Must use a vehicle classname, not a vehicle variable name.
 * Damage values should range from 0.1 to 1
 * This should not be stacked for multiple types of vehicles.
 *
 * Call from init.sqf
 *
 * Arguments
 * 0: Vehicle Classname <CLASSNAME/STRING>
 * 1: Speed to break <NUMBER> (default: 50)
 * 2: Damage from Speed <NUMBER> (default: 0.1)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["C_Truck_02_covered_F", 40, 0.15] call MFUNC(degradedVehicle)
 */

params ["_vehicleClassname", ["_speed", 50], ["_damage", 0.1]];

// Debug
if (is3DENPreview) then {
    private _classCheck = isClass (configFile >> "CfgVehicles" >> _vehicleClassname);
    if (!_classCheck) then {
        ERROR_MSG_1("%1 is not a valid vehicle classname.",_vehicleClassname);
    };
    if (_damage > 1 || _damage <= 0) then {
        ERROR_MSG_1("Damage value (%1) should be between 0.1 - 1",_damage)
    };
};

// Handle engine breaking by going too fast.
if (hasInterface) then {
    [QGVAR(engineFloodedNotification), {["Engine Flooded", 2, [1, 0, 0]] call CBA_fnc_notify}] call CBA_fnc_addEventHandler;

    [{
        params ["_args", "_handle"];
        _args params ["_vehicleClassname", "_speed", "_damage", ["_engineCheck", false]];

        private _playerVehicle = vehicle ace_player;
        if !(_playerVehicle isKindOf _vehicleClassname) exitWith {};

        // Check Speed and Damage
        private _playerSpeed = speed _playerVehicle;
        private _vehicleDamage = _playerVehicle getHitPointDamage "hitEngine";

        // If going too fast, gradually damage engine until it breaks.
        if (_playerSpeed >= _speed) then {
            _vehicleDamage = (_vehicleDamage + _damage) min 1;
            if (_vehicleDamage <= 1) then {
                _playerVehicle setHitPointDamage ["hitEngine", _vehicleDamage]
            };
        };

    }, 2, [_vehicleClassname, _speed, _damage]] call CBA_fnc_addPerFrameHandler;
};

// Will stall by setting fuel to 0, then setting it back to original fuel. If vehicle is too damaged it wont start.
if (isServer) then {
    [_vehicleClassname, "Engine", {
        params ["_vehicle", "_engineState"];

        if (!_engineState) exitWith {};

        private _vehicleDamage = _vehicle getHitPointDamage "hitEngine";
        private _currentFuel = fuel _vehicle;
        if (_currentFuel == 0) exitWith {}; // Avoid Engine flooded spam.

        private _willStall = 0.4 < (random 1);
        if (_vehicleDamage >= 0.75) then {_willStall = true};
        if (_willStall) then {
            [{
                params ["_vehicle"];
                ["ace_common_setFuel", [_vehicle, 0], _vehicle] call CBA_fnc_targetEvent;
                [QGVAR(engineFloodedNotification), [], driver _vehicle] call CBA_fnc_targetEvent;
            }, [_vehicle], 0.5] call CBA_fnc_waitAndExecute;

            [{
                params ["_vehicle", "_currentFuel"];
                ["ace_common_setFuel", [_vehicle, _currentFuel], _vehicle] call CBA_fnc_targetEvent;
            }, [_vehicle, _currentFuel], 5] call CBA_fnc_waitAndExecute;
        };
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};
