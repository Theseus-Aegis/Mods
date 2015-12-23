/*
 * Author: Jonpas
 * Checks if shooting range can be started.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * Can Start Range <BOOL>
 *
 * Example:
 * [controller] call tac_shootingrange_fnc_canStart;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller"];

!(_controller getVariable [QGVAR(running), false])
