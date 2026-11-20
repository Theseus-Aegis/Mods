#include "..\script_component.hpp"
/*
 * Author: TMF Team, Jonpas, Mike
 * Tests group sizes of sides (288 groups per side limit).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Findings <ARRAY>
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testGroupSizes
 *
 * Public: No
 */

private _findings = [];
{
    private _side = _x;
    // Groups, not units: countSide only counts units (HEMTT L-S50 suggests it anyway)
    private _groupCount = count (allGroups select {side _x isEqualTo _side});

    if (_groupCount > GROUP_SIZE_WARNING) then {
        _findings pushBack [WARNING_CODE, format [localize LSTRING(GroupLimit), _side, _groupCount]];
    }
} forEach [west, east, civilian, resistance];

private _largeGroups = allGroups select {count units _x > GROUP_UNIT_LIMIT};
{
    _findings pushBack [WARNING_CODE, format [localize LSTRING(GroupSizeLimit), groupId _x, side _x]];
} forEach _largeGroups;

_findings
