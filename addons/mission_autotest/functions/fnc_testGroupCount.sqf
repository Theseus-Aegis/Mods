#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas, Mike
 * Tests recommended AI amounts for Groups
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testGroupCount
 *
 * Public: No
 */

private _groupUnitCount = count (allGroups select {count units _x > 8});

if (_groupUnitCount > GROUP_LIMIT_WARNING) then {
    if (_groupUnitCount > GROUP_LIMIT_ERROR) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _groupUnitCount, localize LSTRING(ShouldBe), GROUP_LIMIT_ERROR]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _groupUnitCount, localize LSTRING(ShouldBe), GROUP_LIMIT_WARNING]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _groupUnitCount);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
