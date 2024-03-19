#include "..\script_component.hpp"
/*
 * Author: Mike
 * Wrapper for Headless client blacklisting groups and units.
 *
 * Call from initServer on mission start.
 *
 * Arguments:
 * 0: Groups <ARRAY>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [[My_Group_1, My_Group_2]] call MFUNC(blacklistHC)
 */

params [["_groups", []]];

// Cover both cases.
{
    _x setVariable ["acex_headless_blacklist", true, true];
    {
        _x setVariable ["acex_headless_blacklist", true, true];
    } forEach (units _x);
} forEach _groups;
