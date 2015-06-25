/*
 * Author: Jonpas
 * Draws RATEL Marker resource on main display.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

// Need to use createDisplay to allow movement with GUI open
(findDisplay 46) createDisplay QGVAR(RatelMarkerMenu);
