#include "script_component.hpp"
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
 * 5: Invalid Targets <ARRAY>
 * 6: Mode (1 = Time, 2 = Hit (Time Limited), 3 = Hit (Target Limited), 4 = Trigger) <NUMBER>
 * 7: Success <BOOL>
 * 8: Current Score <NUMBER> (default: 0)
 * 9: Maximum Score <NUMBER> (default: 0)
 * 10: Time Elapsed <NUMBER> (default: 0)
 * 11: Triggers <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [idPFH, controller, [controller1, controller2], "range", [target1, target2], [invalidTarget1, invalidTarget2], 1, true] call tac_shootingrange_fnc_popupPFHexit;
 *
 * Public: No
 */

params ["_idPFH", "_controller", "_controllers", "_name", "_targets", "_targetsInvalid", "_mode", "_success", ["_currentScore", 0], ["_maxScore", 0], ["_timeElapsed", 0], ["_triggers", []] ];

// Remove PFH
[_idPFH] call CBA_fnc_removePerFrameHandler;

// Finish or Stop
[_controller, _controllers, _name, _targets, _targetsInvalid, _success, _currentScore, _maxScore, _timeElapsed] call FUNC(stop);

// Cleanup variables
GVAR(targetNumber) = nil;
GVAR(currentScore) = nil;
GVAR(maxScore) = nil;
GVAR(firstRun) = nil;
GVAR(nextTarget) = nil;
GVAR(targetUp) = nil;

// Remove Fired EH if needed
if (_mode > 1) then {
    if (_mode < 5) then {
        ACE_player removeEventHandler ["Fired", GVAR(firedEHid)];
        GVAR(firedEHid) = nil;
    };

    if (_mode == 4) then {
        {
            _x enableSimulation false;
        } forEach _triggers;

        GVAR(targetGroup) = nil;
        GVAR(targetGroupIndex) = nil;
    };
} else {
    GVAR(lastPauseTime) = nil;
};
