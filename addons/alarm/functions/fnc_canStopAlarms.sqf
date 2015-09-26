/*
 * Author: Jonpas
 * Checks if the alarm is playing and can be stopped.
 *
 * Arguments:
 * 0: Button <OBJECT>
 *
 * Return Value:
 * Can Stop Alarms <BOOL>
 *
 * Example:
 * [button] call tac_alarm_canStopAlarms
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_button"];

!((_button getVariable [QGVAR(sources), []]) isEqualTo [])
