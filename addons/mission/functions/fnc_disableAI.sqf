#include "..\script_component.hpp"
/*
 * Author: Mike
 * Faster method of using disableAI command with groups.
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

if ((_groups select 0) isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows groups, detected unit.");
};

private _type = toUpper _type;

{
    {
        _x disableAI _type;
    } forEach (units _x);
} forEach _groups;
