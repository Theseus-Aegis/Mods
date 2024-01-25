#include "..\script_component.hpp"
/*
 * Author: Mike
 * Returns count of alive units in given groups.
 *
 * Arguments:
 * 0: Groups <ARRAY>
 *
 * Return Value:
 * Count of alive units <NUMBER>
 *
 * Example:
 * [[My_Group_One, My_Group_Two]] call MFUNC(countAlive);
 *
 */

params ["_groups"];

if ((_groups select 0) isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows groups, detected unit.");
};

private _count = 0;

{
    _count = _count + ({alive _x} count units _x);
} forEach _groups;

_count
