/*
 * Author: Jonpas
 * Handles passing units to Headless Clients.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_headless_fnc_passUnits;
 *
 * Public: No
 */
#include "script_component.hpp"

#define PASS_AGAIN_AFTER_DELAY [FUNC(pass), [], GVAR(Delay)] call ACE_Common_fnc_waitAndExecute;

// Exit if no HCs present
if (GVAR(headlessClients) isEqualTo []) exitWith { PASS_AGAIN_AFTER_DELAY };

GVAR(headlessClients) params [
    ["_HC1", objNull, [objNull] ],
    ["_HC2", objNull, [objNull] ],
    ["_HC3", objNull, [objNull] ]
];

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Present HCs: %1",GVAR(headlessClients));
};


// Enable round-robin load balancing if more than one HC is present
private _loadBalance = [false, true] select (count GVAR(headlessClients) > 1);


// Get IDs and determine first HC to start with
private _HC1_ID = -1;
private _HC2_ID = -1;
private _HC3_ID = -1;
private _currentHC = 0;

if (!isNull _HC1) then {
    _HC1_ID = owner _HC1;
    _currentHC = 1;
};

if (!isNull _HC2) then {
    _HC2_ID = owner _HC2;

    if (_currentHC == 0) then {
        _currentHC = 2;
    };
};

if (!isNull _HC3) then {
    _HC3_ID = owner _HC3;

    if (_currentHC == 0) then {
        _currentHC = 2;
    };
};


// Prepare statistics
private _numTransferred = 0;
private _numTransferredHC1 = 0;
private _numTransferredHC2 = 0;
private _numTransferredHC3 = 0;


// Pass AI groups
{
    private _pass = true;

    // No pass if empty group
    if (_x isEqualTo []) then {
        _pass = false;
    };

    // No pass if group has already been passed
    if (_pass && {_x getVariable [QGVAR(passed), false]}) then {
        _pass = false;
    };

    if (_pass) then {
        {
            // No pass if player in this group
            if (isPlayer _x) exitWith {
                _pass = false;
            };

            // No pass if any unit in group is blacklisted
            if (_x getVariable [QGVAR(blacklist), false]) exitWith {
                _pass = false;
            };

            // No pass if vehicle unit is in or crew in that vehicle is blacklisted
            if (vehicle _x != _x && {(vehicle _x) getVariable [QGVAR(blacklist), false]}) exitWith {
                _pass = false;
            };

            // No pass if unit has synchronized objects //@todo verify
            /*if !((synchronizedObjects _x) isEqualTo []) exitWith {
                _pass = false;
            };*/
        } forEach (units _x);
    };


    // Round robin between HCs if load balance enabled, else pass all to one HC
    if (_pass) then {
        private _rc = false;

        if (_loadBalance) then {
            switch (_currentHC) do {
                case 1: {
                    _rc = _x setGroupOwner _HC1_ID;
                    _numTransferredHC1 = _numTransferredHC1 + 1;
                    _currentHC = [3, 2] select (!isNull _HC2);
                };
                case 2: {
                    _rc = _x setGroupOwner _HC2_ID;
                    _numTransferredHC2 = _numTransferredHC2 + 1;
                    _currentHC = [1, 3] select (!isNull _HC2);
                };
                case 3: {
                    _rc = _x setGroupOwner _HC3_ID;
                    _numTransferredHC3 = _numTransferredHC3 + 1;
                    _currentHC = [2, 1] select (!isNull _HC2);
                };
                default {
                    TRACE_1("No Valid HC to pass to",_currentHC);
                };
            };
        } else {
            switch (_currentHC) do {
                case 1: {
                    _rc = _x setGroupOwner _HC1_ID;
                    _numTransferredHC1 = _numTransferredHC1 + 1;
                };
                case 2: {
                    _rc = _x setGroupOwner _HC2_ID;
                    _numTransferredHC2 = _numTransferredHC2 + 1;
                };
                case 3: {
                    _rc = _x setGroupOwner _HC3_ID;
                    _numTransferredHC3 = _numTransferredHC3 + 1;
                };
                default {
                    TRACE_1("No Valid HC to pass to",_currentHC);
                };
            };
        };

        // Count pass for statistics if successful
        if (_rc) then {
            _x setVariable [QGVAR(passed), true];
            _numTransferred = _numTransferred + 1;
        };
    };
} forEach allGroups;


// Print statistics
if (GVAR(Log)) then {
    private _numTotal = _numTransferredHC1 + _numTransferredHC2 + _numTransferredHC3;
    ACE_LOGINFO_5("Statistics",_numTransferred,_numTransferredHC1,_numTransferredHC2,_numTransferredHC3,_numTotal);
};

PASS_AGAIN_AFTER_DELAY
