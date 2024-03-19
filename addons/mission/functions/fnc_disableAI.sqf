#include "..\script_component.hpp"
/*
 * Author: Mike
 * Faster method of using disableAI command.
 *
 * Features are on the wiki https://community.bistudio.com/wiki/disableAI
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Groups or Units <ARRAY>
 * 1: Feature <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[My_Group_One, My_Group_Two], "PATH"] call MFUNC(disableAI)
 * [[My_Group_One, My_Unit_One], "AUTOCOMBAT"] call MFUNC(disableAI)
 */

params ["_groupsOrUnits", "_feature"];

{
    if (_x isEqualType objNull) then {
        _x disableAI _feature;
    } else {
        {
            _x disableAI _feature;
        } forEach (units _x);
    };
} forEach _groupsOrUnits;
