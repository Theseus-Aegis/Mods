/*
 * Author: Jonpas
 * Checks if whiteboard has slides.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Has Slides <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_object);

(!isNil {_object getVariable [QGVAR(Slides), nil]})
