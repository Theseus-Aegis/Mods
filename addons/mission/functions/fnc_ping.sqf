#include "..\script_component.hpp"
/*
 * Author: Mike
 * Creates a sonar-like marker ping on a specific location.
 * The ping will remain at the location it started on.
 * List of available colours can be found at: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors
 *
 * Call directly from ACE Action or via server with global argument.
 *
 * Arguments:
 * 0: Location <OBJECT>
 * 1: Global <BOOL> (default: false)
 * 2: Max size of ping <NUMBER> (default: 60, max 120)
 * 3: Colour <STRING> (default: "ColorRed")
 *
 * Return Value:
 * None
 *
 * Examples:
 * [MyObject] call MFUNC(ping)
 * [MyObject, true, 70, "ColorGrey"] call MFUNC(ping)
 */

params ["_location", ["_isGlobal", false], ["_maxSize", 60], ["_colour", "ColorRed"]];

if (_maxSize > 120) exitWith {
    WARNING_1("Max Size (%1) cannot be greater than 120",_maxSize);
};
if (_location getVariable [QGVAR(pingInProgress), false]) exitWith {
    WARNING("Ping already in progress");
};

// Prevent spamming
_location setVariable [QGVAR(pingInProgress), true, _isGlobal];

// Markers are synced globally with every global command. Only needs it done via PFH.
(position _location) params ["_xPos", "_yPos", "_zPos"];
private _markerName = format ["%1_%2%3%4", QUOTE(ADDON), _xPos, _yPos, _zPos];
private _marker = createMarkerLocal [_markerName, _location];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "Border";
_marker setMarkerSizeLocal [0, 0];
_marker setMarkerColorLocal _colour;

[{
    params ["_args", "_handle"];
    _args params ["_location", "_marker", "_isGlobal", "_maxSize"];

    if (isNull _location) exitWith {
        WARNING_1("Ping Location for marker: %1 no longer exists",_markerName);
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteMarker _marker;
    };

    private _size = ((getMarkerSize _marker) select 0) + 1;
    if (_size > _maxSize) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteMarker _marker;

        _location setVariable [QGVAR(pingInProgress), false, _isGlobal];
    };

    if (_isGlobal) then {
        _marker setMarkerSize [_size, _size];
    } else {
        _marker setMarkerSizeLocal [_size, _size];
    };
}, 0.1, [_location, _marker, _isGlobal, _maxSize]] call CBA_fnc_addPerFrameHandler;
