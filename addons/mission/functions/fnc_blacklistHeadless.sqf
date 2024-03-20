#include "..\script_component.hpp"
/*
 * Author: Mike
 * Wrapper for Headless client blacklisting groups and units.
 *
 * Call from initServer on mission start.
 *
 * Arguments:
 * 0: Groups or Units <ARRAY>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [[My_Group_1, My_Unit_1]] call MFUNC(blacklistHeadless)
 */

params [["_groupsOrUnits", []]];

if (!isServer) exitWith {};

{
    _x setVariable ["acex_headless_blacklist", true, true];
} forEach _groupsOrUnits;
