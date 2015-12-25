/*
 * Author: Jonpas
 * Checks current shooting range configuration
 *
 * Arguments:
 * 0: Targets <ARRAY>
 * 1: Markers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[target1, target2], [marker1, marker2]] call tac_shootingrange_fnc_setTargetGroups;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_targets", "_markers"];

// Parse target groups
private _targetGroups = [];
private _lastMarker = "";
private _currentTargetGroup = [];

{
    if (_forEachIndex != 0 && {_x != _lastMarker}) then {
        _targetGroups pushBack _currentTargetGroup;
        _currentTargetGroup = [];
    };

    _currentTargetGroup pushBack (_targets select _forEachIndex);

    if (_forEachIndex + 1 == count _markers) then {
        _targetGroups pushBack _currentTargetGroup;
    };

    _lastMarker = _x;
} forEach _markers;

// Set targets groups on targets
{
    private _targetGroup = _x;
    {
        _x setVariable [QGVAR(targetGroup), _targetGroup, true];
    } forEach _x;
} forEach _targetGroups;
