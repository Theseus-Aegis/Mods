#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if a trigger can be activated.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Stop Range <BOOL>
 *
 * Example:
 * [controller, target] call tac_shootingrange_fnc_canActivateTrigger;
 *
 * Public: No
 */

params ["_controller", "_target"];

(_controller getVariable [QGVAR(running), false]) &&
{(_controller getVariable [QGVAR(starter), objNull]) in thisList} &&
{!isNil QGVAR(targetGroup) && {_target in GVAR(targetGroup)}} &&
{GVAR(firstRun)}
