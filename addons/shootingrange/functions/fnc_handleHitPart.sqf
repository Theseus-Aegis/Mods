/*
 * Author: Jonpas
 * Handles hit part event handler.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Shooter <OBJECT>
 * 2: Bullet <OBJECT> (Unused)
 * 3: Impact Position (Position, ASL) <ARRAY>
 * 4: Bullet Velocity (Vector) <ARRAY> (Unused)
 * 5: Impact Selections <ARRAY> (Unused)
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
 * [@todo] call tac_shootingrange_fnc_handleHitPart;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_shooter", "", "_impactPosition", "", "", "", "", "", "", "_directHit"];

diag_log _impactPosition;
diag_log (_target worldToModel _impactPosition);

private _controller = (_target getVariable [QGVAR(controllers), nil]) select 0;

// Exit if not running
if !(_controller getVariable [QGVAR(running), false]) exitWith {};

// Exit if hit by someone else
if (_shooter != _target getVariable [QGVAR(starter), nil]) exitWith {
    private _text = format ["%1<br/><br/>%2:<br/>%3", localize LSTRING(Warning), localize LSTRING(TargetHitBy), _shooter];
    [_text, 2.5] call ACE_Common_fnc_displayTextStructured;
};

// Exit if target already hit once (moving or in down animation)
if (_target animationPhase "terc" > 0) exitWith {};

// Exit if not direct hit (does not seem to count bullet bouncing)
if (!_directHit) exitWith {};


// Update score
GVAR(score) = GVAR(score) + 1;


private _mode = _target getVariable [QGVAR(mode), 0];
private _targets = +(_target getVariable [QGVAR(targets), nil]); // Copy array (for deleteAt usage)

// Handle random pop-ups in hit-based (exit if last target in hit-based with target limit)
if (_mode == 2 || {_mode == 3 && {GVAR(targetNumber) < _controller getVariable [QGVAR(targetAmount), 0]}}) then {
    // Select random index (save for later removal from array) and new target
    _targets deleteAt GVAR(randomIndex);
    GVAR(randomIndex) = floor (random (count _targets));
    GVAR(nextTarget) = _targets select GVAR(randomIndex);

    // Animate targets
    GVAR(targetUp) animate ["terc", 1]; // Down
    GVAR(nextTarget) animate ["terc", 0]; // Up

    // Prepare for next hit
    GVAR(targetUp) = GVAR(nextTarget);
};

// Handle pop-ups in trigger based
if (_mode in [3, 4]) then {
    // Set next target
    GVAR(targetNumber) = GVAR(targetNumber) + 1;

    if (_mode == 4) then {
        GVAR(targetNumberGroup) = GVAR(targetNumberGroup) + 1;

        // Set next target group if it's last target in group and not last target overall
        if (GVAR(targetNumberGroup) == count GVAR(targetGroup) && {GVAR(targetNumber) <= count _targets}) then {
            GVAR(targetGroup) = (_targets select GVAR(targetNumber)) getVariable [QGVAR(targetGroup), nil];
            GVAR(targetNumberGroup) = 0;
        };
    };
};
