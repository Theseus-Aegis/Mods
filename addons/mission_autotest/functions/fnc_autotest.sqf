/*
 * Author: TMF Team, Jonpas
 * Performs overall autotest and logs the results.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_autotest
 *
 * Public: No
 */
#include "script_component.hpp"

private _ctrlListbox = _this controlsGroupCtrl CTRL_PICTURE;
_ctrlListbox lnbSetColumnsPos [FINDINGS_COLUMN_SIZE]; // Fix entries positioning

// Do the tests
private _findings = call FUNC(testInit);
_findings append (call FUNC(testGroupSizes));
_findings append (call FUNC(testAIAmount));

// Set pictures
{
    _x params ["_type", "_message"];
    private _lnbAdd = _ctrlListbox lnbAddRow ["", _message];

    switch (_type) do {
        case ERROR_CODE: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], ERROR_PICTURE];
        };
        case WARNING_CODE: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], WARNING_PICTURE];
        };
        case PASS_CODE: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], PASS_PICTURE];
        };
        case MESSAGE_CODE: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], MESSAGE_PICTURE];
        };
    };
} forEach _findings;
