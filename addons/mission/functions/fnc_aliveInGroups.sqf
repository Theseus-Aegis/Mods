#include "script_component.hpp"
/*
 * Author: Mike
 * Returns count of alive units in given groups
 *
 * Arguments:
 * 0: Groups <ARRAY>
 *
 * Return Value:
 * Number
 *
 * Example:
 * [[My_Group_One, My_Group_Two]] call MFUNC(aliveInGroups);
 *
 */

params ["_groups"];

private _array = [];

{
    _array pushBack (units _x);
} forEach _groups;

_array = flatten _array;
private _arrayCount = {alive _x} count _array;

_arrayCount;
