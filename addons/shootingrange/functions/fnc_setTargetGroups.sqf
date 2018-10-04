#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks current shooting range configuration
 *
 * Arguments:
 * 0: Targets <ARRAY>
 * 1: Invalid Targets <ARRAY>
 * 2: Markers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[target1, target2], [invalidTarget1, invalidTarget2], [marker1, marker2]] call tac_shootingrange_fnc_setTargetGroups;
 *
 * Public: No
 */

params ["_targets", "_targetsInvalid", "_markers"];

// Parse target groups
private _targetGroups = [];
private _targetInvalidGroups = [];
private _lastMarker = "";
private _currentTargetGroup = [];
private _currentTargetInvalidGroup = [];
private _numTargetsInvalid = count _targetsInvalid;

{
    if (_forEachIndex != 0 && {_x != _lastMarker}) then {
        _targetGroups pushBack _currentTargetGroup;
        _currentTargetGroup = [];
        _targetInvalidGroups pushBack _currentTargetInvalidGroup;
        _currentTargetInvalidGroup = [];
    };

    _currentTargetGroup pushBack (_targets select _forEachIndex);
    if (_numTargetsInvalid > _forEachIndex) then {
        _currentTargetInvalidGroup pushBack (_targetsInvalid select _forEachIndex);
    };

    if (_forEachIndex + 1 == count _markers) then {
        _targetGroups pushBack _currentTargetGroup;
        _targetInvalidGroups pushBack _currentTargetInvalidGroup;
    };

    _lastMarker = _x;
} forEach _markers;

TRACE_2("Target Groups",_targetGroups,_targetInvalidGroups);

// Set targets groups on targets
{
    private _targetGroup = _x;
    private _targetInvalidGroup = _targetInvalidGroups select _forEachIndex;
    {
        _x setVariable [QGVAR(targetGroup), _targetGroup];
        _x setVariable [QGVAR(targetInvalidGroup), _targetInvalidGroup];
    } forEach _x;
} forEach _targetGroups;
