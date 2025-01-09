#include "..\script_component.hpp"
/*
 * Author: Mike
 * Prepares an object for keypad GUI
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Keypad <OBJECT>
 * 1: Required Code <STRING>
 * 2: Maximum Failed Attempts <NUMBER> (default: 3)
 * 2: Maximum Characters <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyObject, "8008153", 5, 7] call MFUNC(keypadSetup)
 */

params ["_object", "_requiredCode", ["_maxFailedAttempts", 3], ["_maxCharacters", 10]];

if (isServer) then {
    _object setVariable [QGVAR(Keypad_currentFailedAttempts), 0, true];
    _object setVariable [QGVAR(Keypad_maxFailedAttempts), _maxFailedAttempts, true];
    _object setVariable [QGVAR(Keypad_maxCharacters), _maxCharacters, true];
    _object setVariable [QGVAR(Keypad_requiredCode), _requiredCode, true];
    _object setVariable [QGVAR(Keypad_Text), "", true];
};

if (!hasInterface) exitWith {};

private _keypadAction = [
    format [QGVAR(keypadAction_%1), _object],
    "Enter Code",
    "",
    {
        createDialog QGVAR(Keypad);
        _player setVariable [QGVAR(keypadInUse), _target, true];
    },
    {
        !(_target getVariable [QGVAR(keypadFinished), false]) &&
        !(_target getVariable [QGVAR(keypadBlocked), false])
    }
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _keypadAction] call ACEFUNC(interact_menu,addActionToObject);
