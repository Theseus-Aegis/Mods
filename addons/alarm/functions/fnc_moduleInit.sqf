/*
 * Author: Jonpas
 * Initializes the module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

params [["_logic", objNull, [objNull]], "_units", "_activated"];

if (!_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract variables from logic
/*_alarms = [_logic getVariable ["Alarms", ""], true, true] call ACE_Common_fnc_parseList;
_buttons = [_logic getVariable ["Buttons", ""], true, true] call ACE_Common_fnc_parseList;
_sounds = [_logic getVariable ["Sounds", ""], false, false] call ACE_Common_fnc_parseList;
_soundNames = [_logic getVariable ["SoundNames", ""], false, false] call ACE_Common_fnc_parseList;*/
_alarms = [_logic getVariable ["Alarms", ""], true, true] call ACE_Slideshow_fnc_makeList;
_buttons = [_logic getVariable ["Buttons", ""], true, true] call ACE_Slideshow_fnc_makeList;
_sounds = [_logic getVariable ["Sounds", []], false, false] call ACE_Slideshow_fnc_makeList;
_soundNames = [_logic getVariable ["SoundNames", []], false, false] call ACE_Slideshow_fnc_makeList;
_duration = _logic getVariable ["Duration", 0];

// Objects synced to the module
{
    _alarms pushBack _x;
    nil
} count (synchronizedObjects _logic);

// Prepare with actions
[_alarms, _buttons, _sounds, _soundNames, _duration] call FUNC(prepareAlarm);

ACE_LOGINFO_2("Alarm Module Initialized on %1 Alarms and %2 Buttons", count _alarms, count _buttons);
