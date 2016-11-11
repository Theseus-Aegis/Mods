/*
 * Author: TMF Team, Jonpas
 * Tests debug console availability.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testDebugConsole
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getMissionConfigValue ["enableDebugConsole", 0];

if (_value != 1) then {
    if (_value == 2) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize LSTRING(DebugConsole_EnabledEveryone));
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    };
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Enabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
