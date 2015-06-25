/*
 * Author: Jonpas
 * Check if the crew of the vehicle can be Unsecured.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Unsecure <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_air_security_fnc_canUnsecure;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_vehicle,_unit);

// Exit if vehicle already Unsecured
if (locked _vehicle < 2 ||
    {!isNil {_vehicle getVariable QGVAR(preventUnlock)}}
) exitWith {false};

// Outside (ACE_Actions)
if (vehicle _unit == _unit) exitWith {true};

// Inside (ACE_SelfActions)
if (vehicle _unit == _vehicle &&
    {driver _vehicle == _unit ||
        {_vehicle turretUnit[0] == _unit ||
            {!alive (driver _vehicle) &&
                {!alive (_vehicle turretUnit[0])}
            }
        }
    }
) exitWith {true};

false
