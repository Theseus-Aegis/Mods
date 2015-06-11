/*
 * Author: Jonpas
 * Check if the crew of the vehicle can be Unsecured.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Unsecure <BOOL>
 *
 * Example:
 * [heli, player] call tac_helicopterevents_fnc_canUnsecure;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_heli,_unit);

private ["_vehicleUnit"];
_vehicleUnit = vehicle _unit;

// Exit if vehicle already Unsecured
if (locked _heli < 2 ||
    {!isNil {_heli getVariable QGVAR(preventUnlock)}}
) exitWith {false};

// Outside (ACE_Actions)
if (_vehicleUnit == _unit) exitWith {true};

// Inside (ACE_SelfActions)
if (_vehicleUnit == _heli &&
    {driver _heli == _unit ||
        {_heli turretUnit[0] == _unit ||
            {!alive (driver _heli) &&
                {!alive (_heli turretUnit[0])}
            }
        }
    }
) exitWith {true};

// Default
false
