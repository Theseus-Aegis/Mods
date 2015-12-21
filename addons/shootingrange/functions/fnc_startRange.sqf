/*
 * Author: Jonpas
 * Starts shooting range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Duration <NUMBER>
 * 3: Pause Duration <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], 5, 3] call tac_shootingrange_fnc_startRange;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_controllers", "_duration", "_pauseDuration"];

private _targets = _controller getVariable [QGVAR(targetsConnected), nil];
if (isNil "_targets") exitWith { ACE_LOGERROR_1("No Targets Connected to Controller!",_controller); };

// Prepare targets
{
    _x animate ["terc", 1]; // Down
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(rangeRunning), true];
} forEach _controllers;

// Started hint
[
    localize LSTRING(CourseStarted),
    QUOTE(PATHTOEF(air_security,UI\secure_ca.paa)) //QUOTE(PATHTOF(UI\courseStarted_ca.paa)) //@todo
] call ACE_Common_fnc_displayTextPicture;


//@todo
// notify others someone started a course (chat, ACE3 notification ... ?)
// countdown hints
// start pop-ups for duration
// notify others someoen finished a course and result (non-official = not under supervision)
