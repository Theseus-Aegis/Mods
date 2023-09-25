#include "..\script_component.hpp"
/*
 * Author: Mike
 * Creates a sonar-like marker ping on a specific location.
 * The ping will remain at the location it started on.
 * List of available colours can be found at: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors
 *
 * Only run on the server.
 *
 * Arguments:
 * 0: Location <OBJECT>
 * 1: Marker Name (must be unique unless tracking the same object) <STRING>
 * 2: Max size of ping <NUMBER> (default: 60, max 120)
 * 3: Colour <STRING> (default: "ColorRed")
 *
 * Return Value:
 * None
 *
 * Examples:
 * [MyObject, "UniqueName"] call MFUNC(ping)
 */

params ["_location", "_markerName", ["_maxSize", 60], ["_colour", "ColorRed"]];

if (!isServer) exitWith {
    [QGVAR(ping), [_location, _markerName, _maxSize, _colour]] call CBA_fnc_serverEvent;
};

if (_maxSize > 120) exitWith {
    WARNING_1("Max Size (%1) cannot be greater than 120",_maxSize);
};
if (_location getVariable [QGVAR(pingInProgress), false]) exitWith {
    WARNING("Ping already in progress");
};

_location setVariable [QGVAR(pingInProgress), true, true];

// Markers are synced globally with every global command. Only needs it done via PFH.
private _marker = createMarkerLocal [_markerName, _location];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "Border";
_marker setMarkerSizeLocal [0, 0];
_marker setMarkerColorLocal _colour;

[{
    params ["_args", "_handle"];
    _args params ["_location", "_marker"];

    if (isNull _location) exitWith {
        WARNING_1("Ping Location for marker: %1 no longer exists",_markerName);
    };

    private _size = ((getMarkerSize _marker) select 0) + 1;
    if (_size > 60) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteMarker _marker;
        _location setVariable [QGVAR(pingInProgress), false, true];
    };

    _marker setMarkerSize [_size, _size];
}, 0.1, [_location, _marker]] call CBA_fnc_addPerFrameHandler;
