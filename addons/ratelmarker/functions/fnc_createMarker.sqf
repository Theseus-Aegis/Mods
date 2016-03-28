/*
 * Author: DaC, Jonpas
 * Creates a marker at coordiantes and adds animation on map open.
 *
 * Arguments:
 * 0: X Coordinate <NUMBER>
 * 1: Y Coordinate <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [100, 200] call tac_ratelmarker_fnc_createMarker;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_firstCoordinate", "_secondCoordinate"];

deleteMarkerLocal QGVAR(marker);

private _marker = createMarkerLocal [QGVAR(marker), [_firstCoordinate,_secondCoordinate]];
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
