/*
 * Author: Jonpas
 * Tests headless clients presence and their playability.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testHCAmount
 *
 * Public: No
 */
#include "script_component.hpp"

private _hc = (all3DENEntities select 3) select {_x isKindOf "HeadlessClient_F"};
private _hcAmount = count _hc;

private _hcPlayable = _hc select {(_x get3DENAttribute "ControlMP") select 0};
private _hcPlayableAmount = count _hcPlayable;

if (_hcPlayableAmount != HC_AMOUNT_RECOMMENDED) then {
    private _text = format ["%1 (%2: %3)", _hcPlayableAmount, localize LSTRING(ShouldBe), HC_AMOUNT_RECOMMENDED];

    if (_hcPlayableAmount < _hcAmount) then {
        _text = format ["%1 - %2: %3 (%4: %5)", _text, localize LSTRING(Unplayable), _hcAmount - _hcPlayableAmount, localize LSTRING(ShouldBe), 0];
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetTooltip (localize LSTRING(HCPlayableOnlyUseful));
    } else {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    };

    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _text;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _hcPlayableAmount);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
