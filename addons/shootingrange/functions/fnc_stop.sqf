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
#include "script_component.hpp"

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

if (_success) then {
    // Check for zero divisor
    private _scorePercentage = 0;
    if (_maxScore > 0) then {
        _scorePercentage = round (_score / _maxScore * 100);
    };

    private _mode = _controller getVariable [QGVAR(mode), MODE_DEFAULT];
    private _ratingType = [localize LSTRING(Accuracy), localize LSTRING(TargetsHit)] select (_mode == 5);
    private _text = format ["%1%2 %3<br/><br/>%4: %5%6 (%7/%8)", localize LSTRING(Range), _name, localize LSTRING(Finished), _ratingType, _scorePercentage, "%", _score, _maxScore];
    private _size = 3;

    if (_timeElapsed > 0) then {
        _text = format ["%1<br/>%2: %3s", _text, localize LSTRING(TimeElapsed), _timeElapsed];
        _size = _size + 0.5;
    };

    private _size = [_size, _size - 0.5] select (_name isEqualTo "");
    [_text, _size] call ACEFUNC(common,displayTextStructured);

    _text = format ["%1<br/><br/>%2: %3", _text, localize LSTRING(By), _playerName];
    [_text, _size + 1, false] call FUNC(notifyVicinity);

    // Print result to server and client RPT
    _text = [_text, "<br/><br/>", ". "] call CBA_fnc_replace; // Remove double newlines first
    _text = [_text, "<br/>", ". "] call CBA_fnc_replace;
    [QGVAR(logResult), _text] call CBA_fnc_serverEvent;
    if (!isServer) then {
        INFO_1("%1",_text);
    };
} else {
    private _text = format ["%1<br/>%2", localize LSTRING(Range), _name];
    if (GVAR(invalidTargetHit)) then {
        _text = format ["%1<br/><br/>%2<br/>%3", _text, localize LSTRING(Failed), localize LSTRING(InvalidTargetHit)];
    } else {
        _text = format ["%1<br/><br/>%2<br/>%3: %4", _text, localize LSTRING(Stopped), localize LSTRING(By), _playerName];
    };
    [_text, 3.5] call ACEFUNC(common,displayTextStructured);
    GVAR(invalidTargetHit) = nil;
};
