/*
 * Author: Jonpas
 * Tests respawn button value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testRespawnButton
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getMissionConfigValue ["respawnButton", 1];

if (_value == 1) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Enabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
};
