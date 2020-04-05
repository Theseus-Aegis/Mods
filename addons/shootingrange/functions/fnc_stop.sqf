#include "script_component.hpp"
/*
 * Author: Jonpas
 * Stops shooting range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Controllers <ARRAY>
 * 2: Name <STRING>
 * 3: Targets <ARRAY>
 * 4: Invalid Targets <ARRAY>
 * 5: Success <BOOL> (default: false)
 * 6: Score <NUMBER> (default: 0)
 * 7: Maximum Score <NUMBER> (default: 0)
 * 8: Time Elapsed <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [controller1, controller2], "range", [target1, target2], [invalidTarget1, invalidTarget2]] call tac_shootingrange_fnc_stop;
 *
 * Public: No
 */

params ["_controller", "_controllers", "_name", "_targets", "_targetsInvalid", ["_success", false], ["_score", 0], ["_maxScore", 0], ["_timeElapsed", 0]];

// Set targets to original
{
    _x setDamage 0;
    [_x, 0] call FUNC(animateTarget); // Up
    _x setVariable [QGVAR(hit), nil];
    _x setVariable [QGVAR(stayDown), false, true]; // Enable automatic pop-ups
} forEach (_targets + _targetsInvalid);

// Set variables
{
    _x setVariable [QGVAR(running), false, true];
    _x setVariable [QGVAR(starter), nil, true];
} forEach _controllers;


// Notification
private _playerName = [ACE_player, true] call ACEFUNC(common,getName);
[_controller, "FD_Finish_F"] call FUNC(playSoundSignal);

private _scorePercentage = 0;
private _mode = _controller getVariable [QGVAR(mode), MODE_DEFAULT];

if (_success) then {
    // Check for zero divisor
    if (_maxScore > 0) then {
        _scorePercentage = round (_score / _maxScore * 100);
    };

    private _ratingType = [LSTRING(Accuracy), LSTRING(TargetsHit)] select (_mode == 5);
    private _texts = [LSTRING(Range), _name, " ", LSTRING(Finished), "<br/><br/>", _ratingType, ": ", str _scorePercentage, "% (", str _score, "/", str _maxScore, ")"];
    private _size = 4;

    if (_timeElapsed > 0) then {
        _texts append ["<br/>", LSTRING(TimeElapsed), ": ", str _timeElapsed, "s"];
        _size = _size + 0.5;
    };

    _texts append ["<br/><br/>", LSTRING(By), ": ", _playerName];
    _size = [_size, _size - 0.5] select (_name isEqualTo "");
    [_texts, _size, true] call FUNC(notifyVicinity);

    // Print result to server and client RPT
    _texts = _texts apply { [_x, "<br/><br/>", ". "] call CBA_fnc_replace }; // Remove double newlines first
    _texts = _texts apply { [_x, "<br/>", ". "] call CBA_fnc_replace };
    [QGVAR(logResult), [_texts]] call CBA_fnc_serverEvent;
    if (!isServer) then {
        [QGVAR(logResult), [_texts]] call CBA_fnc_localEvent;
    };
} else {
    private _texts = [LSTRING(Range), "<br/>", _name, "<br/><br/>"];
    private _size = 4;
    if (GVAR(invalidTargetHit)) then {
        _texts append [LSTRING(Failed), "<br/>", LSTRING(InvalidTargetHit)];
        _size = _size + 0.5;
    } else {
        _texts append [LSTRING(Stopped)];
    };
    _texts append ["<br/><br/>", LSTRING(By), ": ", _playerName];
    [_texts, _size, true] call FUNC(notifyVicinity);
    GVAR(invalidTargetHit) = nil;
};

// Public API event
[QGVAR(stopped), [_controller, _name, _mode, _success, _scorePercentage, _timeElapsed]] call CBA_fnc_localEvent;
