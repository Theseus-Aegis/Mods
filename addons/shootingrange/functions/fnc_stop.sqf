/*
 * Author: Jonpas
 * Stops shooting range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Name <STRING>
 * 3: Targets <ARRAY>
 * 4: Success <BOOL> (default: false)
 * 5: Score <NUMBER> (default: 0)
 * 6: Maximum Score <NUMBER> (default: 0)
 * 7: Time Elapsed <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], "range", [target1, target2]] call tac_shootingrange_fnc_stop;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_controllers", "_name", "_targets", ["_success", false], ["_score", 0], ["_maxScore", 0], ["_timeElapsed", 0]];

// Set targets to original
{
    _x animate ["terc", 0]; // Up
    _x setVariable [QGVAR(alreadyHit), nil];
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(running), false, true];
    _x setVariable [QGVAR(starter), nil, true];
} forEach _controllers;


// Notification
private _playerName = [ACE_player, true] call ACE_Common_fnc_getName;

if (_success) then {
    // Check for zero divisor
    private _scorePercentage = 0;
    if (_maxScore > 0) then {
        _scorePercentage = round (_score / _maxScore * 100);
    };

    private _text = format ["%1%2 %3<br/><br/>%4: %5/%6 (%7%8)", localize LSTRING(Range), _name, localize LSTRING(Finished), localize LSTRING(Accuracy), _score, _maxScore, _scorePercentage, "%"];
    private _size = 4;

    if (_timeElapsed > 0) then {
        _text = format ["%1<br/>%2: %3s", _text, localize LSTRING(TimeElapsed), _timeElapsed];
        _size = _size + 0.5;
    };

    _text = format ["%1<br/><br/>%2: %3", _text, localize LSTRING(By), _playerName];

    private _size = [_size, _size - 0.5] select (_name isEqualTo "");
    [_text, _size, true] call FUNC(notifyVicinity);
} else {
    private _text = format ["%1%2 %3<br/><br/>%4: %5", localize LSTRING(Range), _name, localize LSTRING(Stopped), localize LSTRING(By), _playerName];
    private _size = [2, 1.5] select (_name isEqualTo "");
    [_text, _size] call ACE_Common_fnc_displayTextStructured;
};
