#include "..\script_component.hpp"
/*
 * Author: Mike
 * Checks if any unit in a list is inside of an area.
 *
 * Can be called anywhere.
 *
 * Arguments
 * 0: Units <ARRAY>
 * 1: Marker <MARKER>
 *
 * Return Value:
 * BOOL
 *
 * Example:
 * [[myGuy, myOtherGuy], "MyMarker"] call MFUNC(inArea)
 */

params ["_units", "_marker"];

_unitArray findIf {_x inArea _marker} != -1
