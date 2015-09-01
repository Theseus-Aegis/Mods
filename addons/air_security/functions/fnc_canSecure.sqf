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

params ["_vehicle", "_unit"];

(locked _vehicle < 2) && // Vehicle unlocked
{getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "isUav") == 0} && // Not UAV
{vehicle _unit == _unit || // Outside (ACE_Actions) or Inside (ACE_SelfActions)
    {vehicle _unit == _vehicle &&
        {driver _vehicle == _unit ||
            {_vehicle turretUnit[0] == _unit}
        }
    }
}
