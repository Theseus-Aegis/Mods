#include "script_component.hpp"
/*
 * Author: Mike
 * Tests Wheeled APC amounts.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAPCAmount
 *
 * Public: No
 */

private _apcVehicles = count (vehicles select {_x isKindOf "Wheeled_APC_F"});

if (_apcVehicles > APC_AMOUNT_WARNING) then {
    if (_apcVehicles > APC_AMOUNT_ERROR) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _apcVehicles, localize LSTRING(ShouldBe), APC_AMOUNT_ERROR]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _apcVehicles, localize LSTRING(ShouldBe), APC_AMOUNT_WARNING]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _apcVehicles);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
