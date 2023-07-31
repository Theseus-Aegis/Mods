#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas, Mike
 * Tests Tracked Vehicle amounts.
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

private _trackedVehicles = count (vehicles select {_x isKindOf "Tank_F"});

if (_trackedVehicles > TANK_AMOUNT_WARNING) then {
    if (_trackedVehicles > TANK_AMOUNT_ERROR) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _trackedVehicles, localize LSTRING(ShouldBe), TANK_AMOUNT_ERROR]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _trackedVehicles, localize LSTRING(ShouldBe), TANK_AMOUNT_WARNING]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _trackedVehicles);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
