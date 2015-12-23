/*
 * Author: Jonpas
 * Handles target pop-ups.
 *
 * Arguments:
 * 0: Per-Frame Handler ID <NUMBER>
 * 1: Controller <OBJECT>
 * 2: Controllers <ARRAY>
 * 3: Name <STRING>
 * 4: Targets <ARRAY>
 * 5: Success <BOOL>
 * 6: Score <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ [450, 60, [target1, target2], controller, [controller1, controller2], "range"], idPFH] call tac_shootingrange_fnc_popupPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_idPFH", "_controller", "_controllers", "_name", "_targets", "_success", ["_score", 0]];

// Cleanup variables
GVAR(firstRun) = nil;
GVAR(randomIndex) = nil;
GVAR(nextTarget) = nil;
GVAR(targetUp) = nil;

// Enable automatic pop-ups
nopop = false;

// Finish or Stop
[_controller, _controllers, _name, _targets, _success, _score] call FUNC(stop);

// Remove PFH
[_idPFH] call CBA_fnc_removePerFrameHandler;
