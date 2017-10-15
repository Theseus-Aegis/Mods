/*
 * Author: Jonpas
 * Tests CBA's target debug availability.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testTargetDebug
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getMissionConfigValue ["enableTargetDebug", 0];

if (_value == 1) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Enabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
};
