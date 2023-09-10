#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Tests Apollo setting value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testApollo
 *
 * Public: No
 */

if !(["tac_apollo"] call ACEFUNC(common,isModLoaded)) exitWith {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize LSTRING(NotLoaded));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
};

private _value = [QEGVAR(apollo,enabled), "mission"] call CBA_settings_fnc_get;

if (_value) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Enabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (localize ACELSTRING(Common,Disabled));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
};
