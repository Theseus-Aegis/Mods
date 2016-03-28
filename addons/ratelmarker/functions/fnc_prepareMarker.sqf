/*
 * Author: DaC, Jonpas
 * Prepares a marker based on input and executes it on pilot and turrets.
 *
 * Arguments:
 * 0: X Coordinate <STRING>
 * 1: Y Coordinate <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["100", "200"] call tac_ratelmarker_fnc_canUseMarkerMenu;
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_firstCoordinateRaw", "_secondCoordinateRaw"];

// Put numbers into array elements
private _lenFirst = count (toArray _firstCoordinateRaw);
private _lenSecond = count (toArray _secondCoordinateRaw);

// Add last 1 or 2 numbers of a coordinate based on number of input numbers
if (_lenFirst == 3) then {
    _firstCoordinateRaw = _firstCoordinateRaw + "50";
};
if (_lenFirst == 4) then {
    _firstCoordinateRaw = _firstCoordinateRaw + "0";
};

if (_lenSecond == 3) then {
    _secondCoordinateRaw = _secondCoordinateRaw + "50";
};
if (_lenSecond == 4) then {
    _secondCoordinateRaw = _secondCoordinateRaw + "0";
};

// Parse the string into number
private _firstCoordinate = parseNumber _firstCoordinateRaw;
private _secondCoordinate = parseNumber _secondCoordinateRaw;

// If any coordinate is 0 exit, otherwise place the marker
if (_firstCoordinate == 0 || _secondCoordinate == 0) then {
    // Show ACE Hint
    [localize LSTRING(InvalidCoordinates), QUOTE(PATHTOF(UI\ratelMarker_ca.paa))] call ACE_Common_fnc_displayTextPicture;
} else {
    private _heli = vehicle ACE_player;

    // Feed only occupied turrets
    _seeMarkerUnits = [];
    {
        if (!isNull (_heli turretUnit _x) && !local (_heli turretUnit _x)) then {
            _seeMarkerUnits pushBack (_heli turretUnit _x);
        };
    } forEach allTurrets _heli; // Get all turret paths in the vehicle (without person turrets)

    // Add driver if there is one
    if (!isNull (driver _heli) && !local (driver _heli)) then {
        _seeMarkerUnits pushBack (driver _heli);
    };

    // Create marker locally
    [_firstCoordinate,_secondCoordinate] call FUNC(createMarker);

    // Create marker remotely on array of objects
    ["TAC_ratelMarkerCreated", _seeMarkerUnits, [_firstCoordinate,_secondCoordinate]] call ACE_Common_fnc_targetEvent;
};
