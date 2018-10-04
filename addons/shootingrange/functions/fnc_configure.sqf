#include "script_component.hpp"
/*
 * Author: Jonpas
 * Configures shooting range on run-time, to modify (eg. randomize targets) range dynamically. Should be called from started event locally.
 * Use [] to keep old configuration for the parameter.
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

params [
    ["_controller", objNull, [objNull] ],
    ["_name", "", [""] ],
    ["_mode", 0, [0] ],
    ["_targetsNew", [], [[]] ],
    ["_targetsInvalidNew", [], [[]] ]
];

// Verify data
if (_name == "") exitWith {
    ERROR("Name invalid! Unable to configure on run-time!");
    false
};
if (isNull _controller) exitWith {
    ERROR_1("Controller invalid on Shooting Range%1! Unable to configure on run-time!",_name);
    false
};
if (_mode < 1 || {_mode > 5}) exitWith {
    ERROR_1("No shooting range found on Shooting Range%1! Unable to configure on run-time!",_name);
    false
};
if (_mode == 4) exitWith {
    ERROR_1("Run-time configuration for Trigger mode not supported on Shooting Range%1!",_name);
    false
};

// Remove one from the other if found in both (targets have priority over invalid targets)
if (_targetsNew isEqualTo []) then {
    _targetsNew = (_controller getVariable [QGVAR(targets), []]) select {!(_x in _targetsInvalidNew)};
};
if (_targetsInvalidNew isEqualTo []) then {
    _targetsInvalidNew = (_controller getVariable [QGVAR(targetsInvalid), []]) select {!(_x in _targetsNew)};
};

private _targetsOld = (_targetsNew select 0) getVariable [QGVAR(targets), []];
private _targetsInvalidOld = (_targetsNew select 0) getVariable [QGVAR(targetsInvalid), []];

if (_targetsOld isEqualTo []) exitWith {
    ERROR_1("Unknown error on Shooting Range%1! Unable to retrieve data for run-time configuration!",_name);
    false
};

private _allTargetsNew = _targetsNew + _targetsInvalidNew;
private _allTargetsOld = _targetsOld + _targetsInvalidOld;

if (!(_targetsNew isEqualTo []) && {count (_allTargetsNew select {!(_x in _allTargetsOld)}) > 0}) exitWith {
    ERROR_1("Unknown (invalid) target found on Shooting Range%1! Only targets defined on mission start can be configured at run-time!",_name);
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
    ERROR_1("Controllers not matching for old and new targets on Shooting Range%1! Make sure targets from other ranges or non-defined targets are not used!",_name);
    false
};


// Set data
{
    _x setVariable [QGVAR(targetsRuntime), _targetsNew];
    _x setVariable [QGVAR(targetsInvalidRuntime), _targetsInvalidNew];
} forEach _allTargetsOld;


if (_mode == 5 && {count _targetsNew != count _targetsOld}) then {
    GVAR(maxScore) = count _targetsNew;
};

true
