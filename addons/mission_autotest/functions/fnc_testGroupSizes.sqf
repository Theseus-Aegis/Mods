#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas
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
    private _groupCount = {(side _x) isEqualTo _side} count allGroups;

    if (_groupCount > GROUP_SIZE_WARNING) then {
        _findings pushBack [WARNING_CODE, format [localize LSTRING(GroupLimit), _side, _groupCount]];
    }
} forEach [west, east, civilian, resistance];

_findings
