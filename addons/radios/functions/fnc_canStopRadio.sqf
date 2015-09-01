/*
 * Author: Jonpas
 * Check if vehicle radio can be stopped.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Stop Radio <BOOL>
 *
 * Example:
 * [vehicle, player] call tac_radios_fnc_canStopRadio;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit"];

(!isNil {_vehicle getVariable QGVAR(playingRadio)}) &&
{driver _vehicle != _unit ||
    {_vehicle turretUnit [0] != _unit} ||
    {!alive (driver _vehicle) &&
        {!alive (_vehicle turretUnit [0])}
    }
}
