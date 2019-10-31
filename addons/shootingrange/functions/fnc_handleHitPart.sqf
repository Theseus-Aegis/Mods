#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles hit part event handler.
 * Incorporated vanilla handlers from "a3\structures_f\training\data\scripts".
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Shooter <OBJECT>
 * 2: Bullet <OBJECT> (unused)
 * 3: Impact Position (Position, ASL) <ARRAY> (unused)
 * 4: Bullet Velocity (Vector) <ARRAY> (unused)
 * 5: Impact Selections <ARRAY>
 * 6: Ammo Information <ARRAY> (unused)
 * 7: Impact Direction (Vector) <ARRAY> (unused)
 * 8: Impact Radius <NUMBER> (unused)
 * 9: Impact Surface <STRING> (unused)
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

params ["_target", "_shooter", "", "", "", "_impactSelections", "", "", "", "", "_directHit"];

// Exit if target in "down" animation
if (_target call FUNC(isTargetDown)) exitWith {};

// Exit if target is not actually hit (eg. stand is hit)
if !("target" in _impactSelections || {"pole_bottom" in _impactSelections}) exitWith {};

private _controller = (_target getVariable [QGVAR(controllers), nil]) select 0;

// Exit with vanilla-like handling if not part of a range or not running
if (isNil "_controller" || {!(_controller getVariable [QGVAR(running), false])}) exitWith {
    [_target, 1] call FUNC(animateTarget); // Down

    if ((!isNil "nopop" && {nopop}) || {_target getVariable [QGVAR(stayDown), false]}) exitWith {};

    [{
        _this setDamage 0;
        [_this, 0] call FUNC(animateTarget); // Up
    }, _target, 3] call CBA_fnc_waitAndExecute;
};


private _targets = _target getVariable [QGVAR(targets), []];
// Use targets set by API on runtime if they exist
private _targetsRuntime = _target getVariable [QGVAR(targetsRuntime), []];
_targets = [_targetsRuntime, _targets] select (_targetsRuntime isEqualTo []);

// Exit if invalid target hit and set variable checked in PFH
if !(_target in _targets) exitWith {
    GVAR(invalidTargetHit) = true;
};

// Exit if not direct hit (does not seem to count bullet bouncing)
if (!_directHit) exitWith {
    hint "[TAC] Debug: Indirect Hit";
};

// Exit if hit by someone else
 private _starter = _controller getVariable [QGVAR(starter), nil];
if (_shooter != _starter) exitWith {
    private _shooterName = [_shooter, true] call ACEFUNC(common,getName);
    private _text = format ["%1<br/><br/>%2:<br/>%3", localize LSTRING(Warning), localize LSTRING(TargetHitBy), _shooterName];
    [QACEGVAR(common,displayTextStructured), [_text, 3], [_starter, _shooter]] call CBA_fnc_targetEvent;
};


// Mark target as hit
_target setVariable [QGVAR(hit), true]; // For trigger popup
[_controller, "Beep_Target"] call FUNC(playSoundSignal);
GVAR(currentScore) = GVAR(currentScore) + 1;
[_target, 1] call FUNC(animateTarget); // Down

// Set next target
GVAR(targetNumber) = GVAR(targetNumber) + 1;


private _mode = _controller getVariable [QGVAR(mode), 0];

// Handle random pop-ups in hit-based (exit if last target in hit-based with target limit)
if (_mode == 2 || {_mode == 3 && {GVAR(targetNumber) < _controller getVariable [QGVAR(targetAmount), 0]}}) then {
    GVAR(nextTarget) = selectRandom (_targets - [_target]);

    // Mark target as not yet hit
    GVAR(nextTarget) setVariable [QGVAR(hit), false];

    // Animate target
    _target setDamage 0;
    [GVAR(nextTarget), 0] call FUNC(animateTarget); // Up
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
