/*
 * Author: Jonpas
 * Checks if shooting range can be stopped.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * Can Stop Range <BOOL>
 *
 * Example:
 * [controller] call tac_shootingrange_fnc_canStopRange;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller"];

_controller getVariable [QGVAR(rangeRunning), false]
