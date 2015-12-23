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

params ["_controller", "_controllers", "_name", "_targets", ["_success", false], ["_score", 0]];

// Set targets to original
{
    _x animate ["terc", 0]; // Up
} forEach _targets;

// Set variables
{
    _x setVariable [QGVAR(running), false, true];
} forEach _controllers;


// Notification (including players in vicinity)
private _playerName = [ACE_player, true] call ACE_Common_fnc_getName;

if (_success) then {
    private _text = format ["%1%2 %3<br/><br/>By: %4<br/>Score: %5", localize LSTRING(Module), _name, localize LSTRING(Finished), _playerName, _score];
    private _size = [3.5, 3] select (_name isEqualTo "");

    [_text, _size, true] call FUNC(notifyVicinity);
} else {
    private _text = format ["%1%2 %3<br/><br/>By: %4", localize LSTRING(Module), _name, localize LSTRING(Stopped), _playerName];
    private _size = [3, 2.5] select (_name isEqualTo "");

    [_text, _size] call ACE_Common_fnc_displayTextStructured;
};
