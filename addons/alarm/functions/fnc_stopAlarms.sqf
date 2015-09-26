/*
 * Author: Jonpas
 * Checks if the alarm is playing and can be stopped.
 *
 * Arguments:
 * 0: Button <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [button] call tac_alarm_stopAlarms
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_sources"];
params ["_button"];

_sources = _button getVariable [QGVAR(sources), []];

{
    deleteVehicle _x;
} count _sources;

_button setVariable [QGVAR(sources), [], true];
