#include "script_component.hpp"
/*
 * Author: JoramD
 * Prepare Quick Reference Marker.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_ratelmarker_fnc_prepareQRM
 *
 * Public: No
 */

if (GVAR(QuickReferenceMarkerMode) == 0) exitwith {};

private _playerVehicle = vehicle ace_player;

if (GVAR(QuickReferenceMarkerMode) == 1) then {
    private _markerPos = getPosASL _playerVehicle;
    [_markerPos] call FUNC(createQRM);
};

if (GVAR(QuickReferenceMarkerMode) == 2) then {
    private _traceBegin = AGLToASL positionCameraToWorld [0, 0, 0];
    private _traceEnd = AGLToASL positionCameraToWorld [0, 0, 5000];

    private _markerPos = terrainIntersectAtASL [_traceBegin, _traceEnd];

    if !(_markerPos isEqualTo [0, 0, 0]) then {
        [_markerPos] call FUNC(createQRM);
    } else {
        LLSTRING(QRM_Create) call CBA_fnc_notify;
    };
};
