/*
 * Author: Jonpas
 * Check if the heavy duty hooks can be Attached.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Can Attach Hooks <BOOL>
 *
 * Example:
 * [heli, player] call tac_heavylifter_fnc_canAttach;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_heli);

if (isNil {_heli getVariable QGVAR(prepared)} &&
    {!isEngineOn _heli} &&
    {locked _heli < 2} &&
    {count (getArray (configFile >> "CfgVehicles" >> typeOf _heli >> QGVAR(AttachPos))) == 3}
) exitWith {true};

// Default
false
