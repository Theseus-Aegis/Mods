/*
 * Author: Jonpas
 * Checks current shooting range configuration
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, "range"] call tac_shootingrange_fnc_checkConfig;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_controller", "_name"];

private _duration = _controller getVariable [QGVAR(configDuration), nil];
private _pauseDuration = _controller getVariable [QGVAR(configPauseDuration), nil];
if (isNil "_duration" || {isNil "_pauseDuration"}) exitWith { ACE_LOGERROR_1("No configuration found!",_controller); };

private _textDuration = [localize LSTRING(Infinite), format ["%1s", _duration]] select (_duration > 0);
private _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s", localize LSTRING(Module), _name, localize LSTRING(Configuration), localize LSTRING(Duration), _textDuration, localize LSTRING(PauseDuration), _pauseDuration];

[_text, 3.5] call ACE_Common_fnc_displayTextStructured;
