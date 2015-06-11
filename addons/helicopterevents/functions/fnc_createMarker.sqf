/*
 * Author: DaC, Jonpas
 * Places (or not) a marker based on input.
 *
 * Arguments:
 * 0: X Coordinate (Number)
 * 1: Y Coordinate (Number)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_firstCoordinate,_secondCoordinate);

deleteMarkerLocal QGVAR(RatelMarker);

private ["_marker"];
_marker = createMarkerLocal [QGVAR(RatelMarker), [_firstCoordinate,_secondCoordinate]];
_marker setMarkerTypeLocal "KIA";

hintSilent "RATEL Marker Created \n(Open Map to Zoom to it)";

GVAR(openMapEH) = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    mapAnimAdd [0.5, 0.3, markerPos QGVAR(RatelMarker)];
    mapAnimCommit;
    
    ((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(openMapEH)];
}];
