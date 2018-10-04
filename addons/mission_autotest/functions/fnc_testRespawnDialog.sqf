#include "script_component.hpp"
/*
 * Author: Jonpas
 * Tests respawn dialog value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testRespawnDialog
 *
 * Public: No
 */

private _value = getMissionConfigValue ["respawnDialog", 1];

if (_value == 0) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Enabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
};
