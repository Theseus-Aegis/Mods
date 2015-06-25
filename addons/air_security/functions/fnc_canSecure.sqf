/*
 * Author: Jonpas
 * Check if the crew of the vehicle can be Secured.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Secure <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_air_security_fnc_canSecure;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_vehicle,_unit);

// Exit if vehicle already Secured
if (locked _vehicle > 1) exitWith {false};

// Outside (ACE_Actions)
if (vehicle _unit == _unit) exitWith {true};

// Inside (ACE_SelfActions)
if (vehicle _unit == _vehicle &&
    {driver _vehicle == _unit ||
        {_vehicle turretUnit[0] == _unit}
    }
) exitWith {true};

false
