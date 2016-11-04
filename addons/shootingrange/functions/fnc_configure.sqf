/*
 * Author: Jonpas
 * Configures shooting range post-start. Used to modify (eg. randomize targets) range on run-time. Should be called from started event locally.
 * Not available for Trigger mode!
 *
 * Arguments:
 * 0: Controller (passed directly from event) <OBJECT>
 * 1: Name (passed directly from event) <STRING>
 * 2: Mode (passed directly from event) <NUMBER>
 * 3: Targets <ARRAY> (default: [])
 * 4: Invalid Targets <ARRAY> (default: [])
 *
 * Return Value:
 * Successfully Configured <BOOL>
 *
 * Example:
 * [controller, "Name", 1, [target1, target2], [invalidTarget1, invalidTarget2]] call tac_shootingrange_fnc_configure;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_controller", "_name", "_mode", ["_targetsNew", []], ["_targetsInvalidNew", []]];

// Verify data
if (_mode == 0) exitWith {
    ERROR_1("No shooting range found on%1! Unable to configure on run-time!",_name);
    false
};
if (_mode == 4) exitWith {
    ERROR_1("Run-time configuration for Trigger mode not supported on%1!",_name);
    false
};

private _targetsOld = (_targetsNew select 0) getVariable [QGVAR(targets), []];
private _targetsInvalidOld = (_targetsNew select 0) getVariable [QGVAR(targetsInvalid), []];

private _allTargetsNew = _targetsNew + _targetsInvalidNew;
private _allTargetsOld = _targetsOld + _targetsInvalidOld;

if (count (_allTargetsNew select {!(_x in _allTargetsOld)}) > 0) exitWith {
    ERROR_1("Unknown (invalid) target found on%1! Only targets defined on mission start can be configured at run-time!",_name);
    false
};

private _allTargetsNewControllers = [];
{
    {
        _allTargetsNewControllers pushBackUnique _x;
    } forEach (_x getVariable [QGVAR(controllers), []]);
} forEach _allTargetsNew;

private _allTargetsOldControllers = [];
{
    {
        _allTargetsOldControllers pushBackUnique _x;
    } forEach (_x getVariable [QGVAR(controllers), []]);
} forEach _allTargetsOld;

if (_allTargetsNewControllers isEqualTo [] || {!(_allTargetsNewControllers isEqualTo _allTargetsOldControllers)}) exitWith {
    ERROR_1("Controllers not matching for old and new targets on%1! Make sure targets from other ranges or non-defined targets are not used!",_name);
    false
};


// Set data
{
    _x setVariable [QGVAR(targetsRuntime), _targetsNew];
    _x setVariable [QGVAR(targetsInvalidRuntime), _targetsInvalidNew];
} forEach (_targetsOld + _targetsInvalidOld);


if (_mode == 5 && {count _targetsNew != count _targetsOld}) then {
    GVAR(maxScore) = count _targetsNew;
};

true
