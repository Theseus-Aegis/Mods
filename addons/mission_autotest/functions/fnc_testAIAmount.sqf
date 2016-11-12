/*
 * Author: TMF Team, Jonpas
 * Tests AI amount.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAIAmount
 *
 * Public: No
 */
#include "script_component.hpp"

private _aiAmount = count (allUnits - playableUnits);

if (_aiAmount > AI_AMOUNT_WARNING) then {
    if (_aiAmount > AI_AMOUNT_ERROR) then {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _aiAmount, localize LSTRING(ShouldBe), AI_AMOUNT_ERROR]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _aiAmount, localize LSTRING(ShouldBe), AI_AMOUNT_WARNING]);
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _aiAmount);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
