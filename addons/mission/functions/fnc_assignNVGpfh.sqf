#include "script_component.hpp"
/*
 * Author: Jonpas
 * Per Frame Handler for periodic NVG assignment.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_fnc_assignNVGpfh
 *
 * Public: No
 */

GVAR(assignNVGstate) = sunOrMoon < 1 || moonIntensity > 0.8;

{
    _x call FUNC(assignNVG);
} forEach allUnits;
