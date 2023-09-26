#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Intercepts Escape key for camera exit.
 *
 * Arguments:
 * 0: Display/Control <DISPLAY/CONTROL> (unused)
 * 1: Key <NUMBER>
 * 2: Shift <BOOL> (unused)
 * 3: Ctrl <BOOL> (unused)
 * 4: Alt <BOOL> (unused)
 *
 * Return Value:
 * Key was handled <BOOL>
 *
 * Example:
 * call tac_armory_fnc_onKeyDown
 *
 * Public: No
 */

params ["", "_key"];

if (_key == DIK_ESCAPE && {ACE_player getVariable [QGVAR(inCamera), false]}) exitWith {
    call FUNC(closeCamera);
    true
};

false
