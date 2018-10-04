#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas
 * Tests author value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAuthor
 *
 * Public: No
 */

private _value = getMissionConfigValue ["author", ""];

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _value;

if (_value == "") then {
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
} else {
    if (_value find profileName == -1) then {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
    };
};
