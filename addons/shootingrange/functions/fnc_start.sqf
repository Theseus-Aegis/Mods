/*
 * Author: Jonpas
 * Starts shooting range.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Targets <ARRAY>
 * 2: Controller <OBJECT>
 * 3: Controllers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["range", [target1, target2], controller, [controller1, controller2]] call tac_shootingrange_fnc_start;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_targets", "_controller", "_controllers"];

private _duration = _controller getVariable [QGVAR(configDuration), nil];
private _pauseDuration = _controller getVariable [QGVAR(configPauseDuration), nil];
if (isNil "_duration" || {isNil "_pauseDuration"}) exitWith { ACE_LOGERROR_1("No configuration found!",_controller); };


// Prepare targets
{
    _x animate ["terc", 1]; // Down
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(running), true, true];
} forEach _controllers;


// Started notification (including players in vicinity)
private _textDuration = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
private _playerName = [ACE_player, true] call ACE_Common_fnc_getName;
private _text = format ["%1%2 %3<br/><br/>%4: %5<br/>%6: %7s<br/><br/>By: %8", localize LSTRING(Module), _name, localize LSTRING(Started), localize LSTRING(Duration), _textDuration, localize LSTRING(PauseDuration), _pauseDuration, _playerName];

private _size = [4.5, 4] select (_name isEqualTo "");
[_text, _size, true] call FUNC(notifyVicinity);


// Countdown timer notifications
{
    _x params ["_execTime", "_text"];

    [{
        params ["_controller", "_text"];

        // Exit if not running (eg. stopped)
        if !(_controller getVariable [QGVAR(running), false]) exitWith {};

        // Countdown timer notification
        [_text] call ACE_Common_fnc_displayTextStructured;

    }, [_controller, _text], _execTime] call ACE_Common_fnc_waitAndExecute;

} forEach [ [TIME_GETREADY, localize LSTRING(GetReady)], [TIME_COUNTDOWNSTART, "3"], [TIME_COUNTDOWNSTART + 1, "2"], [TIME_COUNTDOWNSTART + 2, "1"] ];

// Start pop-up handling and final countdown notification
[{
    params ["_controller", "_pauseDuration", "_duration", "_targets", "_controller", "_controllers", "_name"];

    // Exit if not running (eg. stopped)
    if !(_controller getVariable [QGVAR(running), false]) exitWith {};

    // Final countdown notification
    [localize LSTRING(Go)] call ACE_Common_fnc_displayTextStructured;

    // Random target pop-up handling
    private _timeStart = diag_tickTime;
    GVAR(firstRun) = true;

    nopop = true; // Disable automatic pop-ups
    [FUNC(popupPFH), _pauseDuration, [_timeStart, _duration, _targets, _controller, _controllers, _name]] call CBA_fnc_addPerFrameHandler;

}, [_controller, _pauseDuration, _duration, _targets, _controller, _controllers, _name], TIME_COUNTDOWNSTART + 3] call ACE_Common_fnc_waitAndExecute;
