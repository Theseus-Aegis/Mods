#include "..\script_component.hpp"
/*
 * Author: Jonpas
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

private _value = getMissionConfigValue ["enableDebugConsole", 0];

if (_value in [0, 2]) then {
    if (_value == 2) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize LSTRING(DebugConsole_EnabledEveryone));
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    };
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
} else {
    if (_value isEqualType []) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize LSTRING(DebugConsole_EnabledSpecific));
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize LSTRING(DebugConsole_EnabledAdmin));
    };
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
