/*
 * Author: Jonpas
 * Check if the crew of the vehicle can be Secured.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Secure <BOOL>
 *
 * Example:
 * [heli, player] call tac_helicopterevents_fnc_canSecure;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_heli,_unit);

private ["_vehicleUnit"];
_vehicleUnit = vehicle _unit;

// Exit if vehicle already Secured
if (locked _heli > 1) exitWith {false};

// Outside (ACE_Actions)
if (_vehicleUnit == _unit) exitWith {true};

// Inside (ACE_SelfActions)
if (_vehicleUnit == _heli &&
    {driver _heli == _unit ||
        {_heli turretUnit[0] == _unit}
    }
) exitWith {true};

// Default
false
