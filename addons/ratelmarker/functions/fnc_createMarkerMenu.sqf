/*
 * Author: Jonpas
 * Opens coordinate input display.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_ratelmarker_fnc_createMarkerMenu;
 *
 * Public: No
 */
#include "script_component.hpp"

// Has to be display to allow movement
private _dummyFixDisplay = (findDisplay 46) createDisplay QGVAR(RatelMarkerMenu);

// Fix future openings by throwing key events in the display signalling CBA keybind
_dummyFixDisplay displayAddEventHandler ["KeyUp", {[_this, "KeyUp"] call CBA_events_fnc_keyHandler}];
_dummyFixDisplay displayAddEventHandler ["KeyDown", {[_this,"KeyDown"] call CBA_events_fnc_keyHandler}];
