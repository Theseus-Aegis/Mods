#include "script_component.hpp"
/*
 * Author: Jonpas
 * Plays sound signal on all controllers and extra sound sources.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Sound Classname (CfgSound) <STRING>
 * 2: Range <NUMBER> (default: 25)
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, "FD_Timer_F", 25] call tac_shootingrange_fnc_playSoundSignal;
 *
 * Public: No
 */

params ["_controller", "_sound", ["_range", NOTIFY_DISTANCE]];

private _soundSources = _controller getVariable [QGVAR(soundSources), []];

{
    [QGVAR(playSignal), [_x, _sound, _range]] call CBA_fnc_globalEvent;
} forEach _soundSources;
