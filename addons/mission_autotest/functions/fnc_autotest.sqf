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

// Set pictures
{
    _x params ["_type", "_message"];

    // Cut full name to prevent overlapping scroll bar
    if (count _message > MESSAGE_LENGTH + 3) then {
        _message = [_message, 0, MESSAGE_LENGTH] call CBA_fnc_substr;
        _message = [_message] call CBA_fnc_rightTrim;
        _message = [_message, "..."] joinString "";
    };

    private _lnbAdd = _ctrlListbox lnbAddRow ["", _message];
    _ctrlListbox lbSetTooltip [_forEachIndex * 2, _message]; // Requires multiplication by 2 to be set on proper index (no idea why)

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
