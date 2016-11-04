/*
 * Author: Jonpas
 * Configures shooting range post-start. Used to modify (eg. randomize targets) range on run-time. Should be called from started event locally.
 * Not available for Trigger mode!
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Targets <ARRAY> (default: [])
 *
 * Return Value:
 * Successfully Configured <BOOL>
 *
 * Example:
 * [controller, [target1, target2], [targetInvalid1, targetInvalid2], [trigger1, trigger2]] call tac_shootingrange_fnc_configure;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_controller", ["_targetsNew", []]];

private _mode = _controller getVariable [QGVAR(mode), 0];

// Verify data
if (_mode == 0) exitWith {
    ERROR_1("No shooting range found on controller (%1)! Unable to configure!",_controller);
    false
};
if (_mode == 4) exitWith {
    ERROR_1("Configuration for Trigger mode not yet supported on shooting range with controller %2!",_controller);
    false
};

private _targetsOrig = (_targetsNew select 0) getVariable [QGVAR(targets), []];

// Set data
{
    _x setVariable [QGVAR(targetsRuntime), _targetsNew];
} forEach (_targetsOrig + _targetsInvalid);


if (_mode == 5 && {count _targetsNew != count _targetsOrig}) then {
    GVAR(maxScore) = count _targetsNew;
};

true
