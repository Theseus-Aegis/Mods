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

private ["_marker"];
params ["_firstCoordinate", "_secondCoordinate"];

deleteMarkerLocal QGVAR(marker);

_marker = createMarkerLocal [QGVAR(marker), [_firstCoordinate,_secondCoordinate]];
_marker setMarkerTypeLocal "KIA";

// Show ACE Hint
[localize LSTRING(MarkerCreated), QUOTE(PATHTOF(UI\ratelMarker_ca.paa))] call ACE_Common_fnc_displayTextPicture;

// Exit if map EH already installed
if (!isNil QGVAR(openMapEH)) exitWith {};

// Attach map open EH, animate focus to marker and remove the EH
GVAR(openMapEH) = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    mapAnimAdd [0.5, 0.3, markerPos QGVAR(marker)];
    mapAnimCommit;

    ((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(openMapEH)];
    GVAR(openMapEH) = nil;
}];
