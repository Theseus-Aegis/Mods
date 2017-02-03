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
    private _messageCut = _message;
    if (count _messageCut > MESSAGE_LENGTH + 3) then {
        _messageCut = [_messageCut, 0, MESSAGE_LENGTH] call CBA_fnc_substr;
        _messageCut = [_messageCut] call CBA_fnc_rightTrim;
        _messageCut = [_messageCut, "..."] joinString "";
    };

    private _lnbAdd = _ctrlListbox lnbAddRow ["", _messageCut];
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
