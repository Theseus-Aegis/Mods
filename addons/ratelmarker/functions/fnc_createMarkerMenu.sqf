#include "script_component.hpp"
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

// Has to be display to allow movement
private _display = (findDisplay 46) createDisplay QGVAR(menu);
uiNamespace setVariable [QGVAR(menuDisplay), _display];

// Fix future openings by throwing key events in the display signaling CBA keybind to register the keys
_display displayAddEventHandler ["KeyUp", {[_this, "KeyUp"] call CBA_events_fnc_keyHandler}];
_display displayAddEventHandler ["KeyDown", {[_this,"KeyDown"] call CBA_events_fnc_keyHandler}];
