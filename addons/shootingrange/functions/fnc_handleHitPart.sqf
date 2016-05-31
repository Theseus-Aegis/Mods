/*
 * Author: Jonpas
 * Handles hit part event handler.
 * Incorporated vanilla handlers from "a3\structures_f\training\data\scripts"
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Shooter <OBJECT>
 * 2: Bullet <OBJECT> (Unused)
 * 3: Impact Position (Position, ASL) <ARRAY>
 * 4: Bullet Velocity (Vector) <ARRAY> (Unused)
 * 5: Impact Selections <ARRAY>
 * 6: Ammo Information <ARRAY> (Unused)
 * 7: Impact Direction (Vector) <ARRAY> (Unused)
 * 8: Impact Radius <NUMBER> (Unused)
 * 9: Impact Surface <STRING> (Unused)
 * 10: Direct Hit <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, shooter, nil, [0, 0, 0], nil, ["target"], nil, nil, nil, nil, true] call tac_shootingrange_fnc_handleHitPart;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_shooter", "", "_impactPosition", "", "_impactSelections", "", "", "", "", "_directHit"];

// Exit if target are is not hit (eg. stand is hit)
if !("target" in _impactSelections) exitWith {};

private _controller = (_target getVariable [QGVAR(controllers), nil]) select 0;

// Exit if not part of a range or not running
if (isNil "_controller" || {!(_controller getVariable [QGVAR(running), false])}) exitWith {
    _target setDamage 0;
    [_target, 1] call FUNC(animateTarget); // Down

    if ((!isNil "nopop" && nopop) || _target getVariable [QGVAR(stayDown), false]) exitWith {};

    [{
        [_this, 0] call FUNC(animateTarget); // Up
    }, _target, 3] call CBA_fnc_waitAndExecute;
};

private _targets = _target getVariable [QGVAR(targets), []];

// Exit if invalid target hit and set variable checked in PFH
if !(_target in _targets) exitWith {
    GVAR(invalidTargetHit) = true;
};

// Exit if target already hit
if (_target getVariable [QGVAR(alreadyHit), false]) exitWith {};

// Exit if not direct hit (does not seem to count bullet bouncing)
if (!_directHit) exitWith {
    hint "[TAC] Debug: Indirect Hit";
    [_target, 0] call FUNC(animateTarget); // Up
};

// Exit if hit by someone else
 private _starter = _controller getVariable [QGVAR(starter), nil];
if (_shooter != _starter) exitWith {
    [_target, 0] call FUNC(animateTarget); // Up

    private _shooterName = [_shooter, true] call ACE_Common_fnc_getName;
    private _text = format ["%1<br/><br/>%2:<br/>%3", localize LSTRING(Warning), localize LSTRING(TargetHitBy), _shooterName];
    ["displayTextStructured", [_starter, _shooter], [_text, 3]] call ACE_Common_fnc_targetEvent;
};


[_controller, "Beep_Target"] call FUNC(playSoundSignal);

// Mark target as already hit
_target setVariable [QGVAR(alreadyHit), true];

// Update score / Set next target
GVAR(targetNumber) = GVAR(targetNumber) + 1;


private _mode = _controller getVariable [QGVAR(mode), 0];

// Handle random pop-ups in hit-based (exit if last target in hit-based with target limit)
if (_mode == 2 || {_mode == 3 && {GVAR(targetNumber) < _controller getVariable [QGVAR(targetAmount), 0]}}) then {
    GVAR(nextTarget) = selectRandom _targets;

    // Animate target
    [GVAR(nextTarget), 0] call FUNC(animateTarget); // Up

    // Mark target as not yet hit
    GVAR(nextTarget) setVariable [QGVAR(alreadyHit), false];
};

// Handle pop-ups in trigger based
if (_mode == 4) then {
    // Set next target group index
    GVAR(targetGroupIndex) = GVAR(targetGroupIndex) + 1;

    // Set next target group if it's last target in group and not last target overall
    if ((GVAR(targetGroupIndex) >= count GVAR(targetGroup)) && {GVAR(targetNumber) <= count _targets}) then {
        GVAR(targetGroup) = (_targets select GVAR(targetNumber)) getVariable [QGVAR(targetGroup), nil];
        GVAR(targetGroupIndex) = 0;
    };
    TRACE_2("Trigger Hit",GVAR(targetGroupIndex),GVAR(targetGroup));
};
