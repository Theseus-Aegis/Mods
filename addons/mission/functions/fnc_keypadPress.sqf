#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles specific keypad presses, runs locally on whichever player is interacting.
 *
 * Called from GUI
 *
 * Arguments:
 * 0: Button Press <NUMBER/STRING> (default: "Clear")
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call FUNC(keypadPress)
 */

params [["_keypadInput", "Clear"]];

private _keypad = ace_player getVariable [QGVAR(keypadInUse), objNull];

private _currentFailedAttempts = _keypad getVariable [QGVAR(Keypad_currentFailedAttempts), 0];
private _maxFailedAttempts = _keypad getVariable [QGVAR(Keypad_maxFailedAttempts), 0];
private _maxCharacters = _keypad getVariable [QGVAR(Keypad_maxCharacters), 0];
private _requiredCode = _keypad getVariable [QGVAR(Keypad_requiredCode), 0];
private _text = _keypad getVariable [QGVAR(Keypad_Text), ""];

if (_keypadInput isEqualTo "Clear") exitWith {
    _keypad setVariable [QGVAR(Keypad_Text), "", true];
    ctrlSetText [1000, "Code Cleared"];
};

if (_keypadInput isEqualTo "Enter") exitWith {

    // Handle failures
    if (_text isNotEqualTo _requiredCode) exitWith {
        ctrlSetText [1000, "Invalid"];
        _keypad setVariable [QGVAR(Keypad_Text), "", true];
        private _failedAttempts = _currentFailedAttempts + 1;
        _keypad setVariable [QGVAR(Keypad_currentFailedAttempts), _failedAttempts, true];

        // Block keypad if too many failed attempts.
        if (_failedAttempts >= _maxFailedAttempts) exitWith {
            [QGVAR(keypadFailure), [_keypad, ace_player, _failedAttempts]] call CBA_fnc_globalEvent;
            _keypad setVariable [QGVAR(keypadBlocked), true, true];
            ctrlSetText [1000, "Keypad Locked"];
            [{
                closeDialog 2;
            }, [], 2] call CBA_fnc_waitAndExecute;
        };
    };

    // Success
    ctrlSetText [1000, "Accepted!"];
    [QGVAR(keypadSuccess), [_keypad, ace_player]] call CBA_fnc_globalEvent;
    _keypad setVariable [QGVAR(keypadFinished), true, true];

    [{
        closeDialog 2;
    }, [], 2] call CBA_fnc_waitAndExecute;
};

// Numbers
if (_keypadInput isEqualType 0) then {
    private _newText = _text + format ["%1", _keypadInput];
    _keypad setVariable [QGVAR(Keypad_Text), _newText, true];
    ctrlSetText [1000, _newText];

    // Handles max characters
    private _characterCount = count _newText;
    if (_characterCount > _maxCharacters) exitWith {
        "Code too long, Resetting" call CBA_fnc_notify;
        _keypad setVariable [QGVAR(Keypad_Text), "", true];
        ctrlSetText [1000, "Enter Keycode"];
    };
};
