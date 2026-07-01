#include "..\script_component.hpp"
/*
 * Author: Mike
 * Checks if all units of an array are in a specific area, same logic as inArea function just checking for any units outside of an area.
 *
 * Can be called anywhere.
 *
 * Arguments
 * 0: Unit Array <ARRAY>
 * 1: Marker <MARKER>
 *
 * Return Value:
 * BOOL
 *
 * Example:
 * [[myGuy, myOtherGuy], "MyMarker"] call MFUNC(inAreaAllUnits)
 */

params ["_units", "_marker"];

_units findIf {!(_x inArea _marker)} == -1

if (_unitsInArea == -1) exitWith {
    true
};

false
