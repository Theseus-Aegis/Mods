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
 * 5: Target Change Event (1 = Time, 2 = Hit, 3 = Trigger) <NUMBER>
 * 6: Success <BOOL>
 * 7: Score <NUMBER> (default: 0)
 * 8: Maximum Score <NUMBER> (default: 0)
 * 9: Time Elapsed <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [idPFH, controller, [controller1, controller2], "range", [target1, target2], 1, true] call tac_shootingrange_fnc_popupPFHexit;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_idPFH", "_controller", "_controllers", "_name", "_targets", "_targetChangeEvent", "_success", ["_score", 0], ["_maxScore", 0], ["_timeElapsed", 0]];

// Remove PFH
[_idPFH] call CBA_fnc_removePerFrameHandler;

// Enable automatic pop-ups
nopop = false;

// Finish or Stop
[_controller, _controllers, _name, _targets, _success, _score, _maxScore, _timeElapsed] call FUNC(stop);

// Cleanup variables
GVAR(firstRun) = nil;
GVAR(randomIndex) = nil;
GVAR(nextTarget) = nil;
GVAR(targetUp) = nil;

// Remove Fired EH if needed
if (_targetChangeEvent > 1) then {
    ACE_player removeEventHandler ["Fired", GVAR(firedEHid)];
    GVAR(firedEHid) = nil;
};
