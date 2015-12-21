/*
 * Author: Jonpas
 * Stops shooting range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2]] call tac_shootingrange_fnc_stopRange;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_controllers"];

private _targets = _controller getVariable [QGVAR(targetsConnected), nil];
if (isNil "_targets") exitWith { ACE_LOGERROR_1("No Targets Connected to Controller!",_controller); };

// Set targets to original
{
    _x animate ["terc", 0]; // Up
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(rangeRunning), false];
} forEach _controllers;

// Stopped hint
[
    localize LSTRING(CourseStopped),
    QUOTE(PATHTOEF(air_security,UI\secure_ca.paa)) //QUOTE(PATHTOF(UI\courseStopped_ca.paa)) //@todo
] call ACE_Common_fnc_displayTextPicture;
