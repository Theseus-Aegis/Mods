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
(findDisplay 46) createDisplay QGVAR(RatelMarkerMenu);
