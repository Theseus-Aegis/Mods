#include "..\script_component.hpp"
/*
 * Author: Mike
 * Gives visual area marker for all triggers. Designed only for debug purposes and mission testing purposes.
 *
 * Call from the server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call MFUNC(debugTriggerArea)
 */

private _allTriggers = allMissionObjects "EmptyDetector";

{
    private _markerName = format ["%1", _x];
    private _marker = createMarkerLocal [_markerName, _x];

    triggerArea _x params ["_sizeX", "_sizeY", "_angle", "_isRectangle", "_sizeZ"];

    _marker setMarkerBrushLocal "Border";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerDirLocal _angle;
    _marker setMarkerSizeLocal [_sizeX, _sizeY];

    if (_isRectangle) then {
        _marker setMarkerShape "RECTANGLE";
    } else {
        _marker setMarkerShape "ELLIPSE";
    };
} forEach _allTriggers;
