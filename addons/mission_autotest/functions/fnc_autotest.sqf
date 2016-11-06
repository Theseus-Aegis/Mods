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
_ctrlListbox lnbSetColumnsPos [COLUMN_SIZE];


// Do the tests
private _output = [];
_output append (call FUNC(testInit));


// Group check
{
    private _side = _x;
    private _groupCount = {(side _x) isEqualTo _side} count allGroups;

    if (_groupCount > 100) then {
        _output pushBack [__WARNING, format [localize LSTRING(GroupLimit), _side, _groupCount]];
    }
} forEach [west, east, civilian, resistance];

// AI amount check
private _aiCount = allUnits - playableUnits;
if (_aiCount > 100) then {
    if (_aiCount > 150) then {
        _output pushBack [__ERROR, format [localize LSTRING(AIAmount), _aiCount]];
    } else {
        _output pushBack [__WARNING, format [localize LSTRING(AIAmount), _aiCount]];
    };
};


// Set picture
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
