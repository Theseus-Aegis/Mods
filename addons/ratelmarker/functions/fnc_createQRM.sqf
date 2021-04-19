#include "script_component.hpp"
/*
 * Author: JoramD
 * Create Quick Reference Marker.
 *
 * Arguments:
 * 0: Marker Position <PositionASL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_markerPos] call tac_ratelmarker_fnc_createQRM;
 *
 * Public: No
 */

params ["_markerPos"];

[
    format ["QRM [%1] (%2)", (mapGridPosition _markerPos), [daytime, "HH:MM"] call BIS_fnc_timeToString],
    _markerPos
] call ace_microdagr_fnc_deviceAddWaypoint;
