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

// Fix entries positioning
private _ctrlListbox = _this controlsGroupCtrl 101;
_ctrlListbox lnbSetColumnsPos [FINDINGS_COLUMN_SIZE];


// Do the tests
private _output = call FUNC(testInit);
_output append (call FUNC(testGroupSizes));
_output append (call FUNC(testAIAmount));


// Set pictures
{
    _x params ["_type", "_message"];
    private _lnbAdd = _ctrlListbox lnbAddRow ["", _message];

    switch (_type) do {
        case __ERROR: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], QPATHTOF(UI\error.paa)];
        };
        case __WARNING: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], QPATHTOF(UI\warning.paa)];
        };
        case __PASS: {
            _ctrlListbox lnbSetPicture [[_lnbAdd, 0], QPATHTOF(UI\pass.paa)];
        };
    };
} forEach _output;
