/*
 * Author: Jonpas
 * Handles hit part event handler.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Shooter <OBJECT>
 * 2: Bullet <OBJECT>
 * 3: Impact Position (Position, ASL) <ARRAY>
 * 4: Bullet Velocity (Vector) <ARRAY>
 * 5: Impact Selections <ARRAY>
 * 6: Ammo Information <ARRAY>
 * 7: Impact Direction (Vector) <ARRAY>
 * 8: Impact Radius <NUMBER>
 * 9: Impact Surface <STRING>
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

params ["_target", "_shooter", "_bullet", "_impactPosition", "_bulletVelocity", "_impactSelections", "_ammoInfo", "_impactDirection", "_impactRadius", "_impactSurface", "_directHit"];

private _starter = _target getVariable [QGVAR(starter), nil];
private _controller = (_target getVariable [QGVAR(controllers), nil]) select 0;
private _targetChangeEvent = _target getVariable [QGVAR(targetChangeEvent), nil];
private _targets = +(_target getVariable [QGVAR(targets), nil]); // Copy array (for deleteAt usage)
if (isNil "_starter" || {isNil "_controller"} || {isNil "_targetChangeEvent"} || {isNil "_targets"}) exitWith {diag_log "nil"};

// Exit if not running
if !(_controller getVariable [QGVAR(running), false]) exitWith {};

// Exit if hit by someone else
if (_shooter != _starter) exitWith {
    private _text = format ["%1<br/><br/>Target hit by: %2", localize LSTRING(Warning), _shooter];
    [_text, 2] call ACE_Common_fnc_displayTextStructured;
};

// Exit if not direct hit
if (!_direct) exitWith {};

// Exit if target already hit once (moving or in down animation)
if (_target animationPhase "terc" > 0) exitWith {};


// Update score
GVAR(score) = GVAR(score) + 1;


// Handle random target pop-ups when target change event is "Time"
if (_targetChangeEvent == 2) then {
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
