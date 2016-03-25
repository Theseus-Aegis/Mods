/*
 * Author: Jonpas
 * Sets current radio volume.
 *
 * Arguments:
 * 0: Volume <NUMBER>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, vehicle] call tac_radios_fnc_changeVolume;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_volume", "_vehicle"];

_vehicle setVariable [QGVAR(Volume), _volume];
