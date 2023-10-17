#include "..\script_component.hpp"
/*
 * Author: Mike
 * Creates map markers for building outlines with an optional filter for only objects that inherit from buildings.
 * Function should not be ran at any point after mission start.
 * This is mainly designed around houses and custom structures being marked on the map, if using a layer ensure only buildings or walls are inside it.
 *
 * Call from initServer.sqf on mission start.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Filter to only buildings <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [[MyObject, MyObject2]] call MFUNC(markBuildings);
 * [(getMissionLayerEntities "Test Layer" select 0)] call MFUNC(markBuildings);
*/

params ["_objectArray", ["_filter", true]];

if (_objectArray isEqualTo []) exitWith {
    WARNING("Object Array is empty");
};

// Filter doesn't catch everything, Arma has so many weird objects inheriting from Building, House_F etc.
if (_filter) then {
    _objectArray = _objectArray select {_x isKindOf "Building"};
};

{
    (boundingBoxReal _x) params ["_posRelative1", "_posRelative2"];
    private _width = abs (_posRelative2 select 0) - (_posRelative1 select 0);
    private _height = abs (_posRelative2 select 1) - (_posRelative1 select 1);

    // Marker name has to be unique
    (position _x) params ["_xPos", "_yPos", "_zPos"];
    private _markerName = format ["%1_%2%3%4", QUOTE(ADDON), _xPos, _yPos, _zPos];
    private _marker = createMarkerLocal [_markerName, getPos _x];
    _marker setMarkerBrushLocal "SolidFull";
    _marker setMarkerColorLocal "ColorGrey";
    _marker setMarkerDirLocal (getDir _x);
    _marker setMarkerSizeLocal [_width / 2, _height / 2];
    _marker setMarkerShape "RECTANGLE";
} forEach _objectArray;
