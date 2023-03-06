#include "script_component.hpp"
/*
 * Author: Mike
 * Faster method of using disableAI command.
 *
 * Types are on the wiki https://community.bistudio.com/wiki/disableAI
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Groups <ARRAY>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[My_Group_One, My_Group_Two], "PATH"] call MFUNC(disableAI)
 * [[My_Group_One, My_Group_Two], "AUTOCOMBAT"] call MFUNC(disableAI)
 */

params ["_groups", "_type"];

private _type = toLower _type;

{
    {
        _x disableAI _type;
    } forEach (units _x);
} forEach _groups;
