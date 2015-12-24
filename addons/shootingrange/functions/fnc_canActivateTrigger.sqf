/*
 * Author: Jonpas
 * Checks if a trigger can be activated.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Target <OBJECT>
 * 2: Trigger Number <NUMBER>
 *
 * Return Value:
 * Can Stop Range <BOOL>
 *
 * Example:
 * [controller, target, 3] call tac_shootingrange_fnc_canActivateTrigger;
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_controller", "_target", "_triggerNumber"];

private _tempTime = _controller getVariable [QGVAR(countdownTime), COUNTDOWNTIME_DEFAULT];
TRACE_3("Can Act Trigger",diag_tickTime,GVAR(timeStart),_tempTime);

(_controller getVariable [QGVAR(running), false]) &&
{(_target getVariable [QGVAR(starter), objNull]) in thisList} &&
{_triggerNumber == GVAR(targetNumber)} &&
{!isNil QGVAR(timeStartCountdown) &&
    {diag_tickTime >= GVAR(timeStartCountdown) + (_controller getVariable [QGVAR(countdownTime), COUNTDOWNTIME_DEFAULT])}
}
