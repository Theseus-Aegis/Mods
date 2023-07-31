#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas, Mike
 * Tests AP AI amount
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAPAmount
 *
 * Public: No
 */

private _apAmount = count (allUnits select {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "TACU_isAP")) == 1});

if (_apAmount > AP_AMOUNT_WARNING) then {
    if (_apAmount > AP_AMOUNT_ERROR) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _apAmount, localize LSTRING(ShouldBe), AP_AMOUNT_ERROR]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _apAmount, localize LSTRING(ShouldBe), AP_AMOUNT_WARNING]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _apAmount);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
