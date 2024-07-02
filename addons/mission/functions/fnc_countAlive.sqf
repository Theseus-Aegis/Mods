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

if (is3DENPreview) then {
    private _typeCheck = _groups findIf {_x isEqualType "OBJECT"};
    if (_typeCheck != -1) exitWith {
        ERROR_MSG_1("Input only allows groups, detected unit at index (%1)",_typeCheck);
    };
};

private _count = 0;

{
    _count = _count + ({alive _x} count units _x);
} forEach _groups;

_count
