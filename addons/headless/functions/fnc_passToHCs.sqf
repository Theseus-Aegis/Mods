/*
 * Author: Jonpas
 * Handles passing units to Headless Clients.
 *
 * Arguments:
 * 0: Headless Clients <ARRAY>
 *    0: Headless Client 1 <OBJECT> (default: nil)
 *    1: Headless Client 2 <OBJECT> (default: nil)
 *    2: Headless Client 3 <OBJECT> (default: nil)
 * 1: Delay <NUMBER> (default: 60)
 * 2: Log <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[hc1, hc2, hc3], 60, false] call tac_common_fnc_passToHCs;
 *
 * Public: No
 */
#include "script_component.hpp"

#define PASS_AGAIN_AFTER_DELAY [FUNC(passToHCs), [_headlessClients, _delay], _delay] call ACE_Common_fnc_waitAndExecute;

params [
    ["_headlessClients", [], [[]] ],
    ["_delay", DELAY_DEFAULT, [0] ],
    ["_log", false, [true] ]
];

if (_headlessClients isEqualTo []) exitWith { PASS_AGAIN_AFTER_DELAY };

_headlessClients params [
    ["_HC1", objNull, [objNull] ],
    ["_HC2", objNull, [objNull] ],
    ["_HC3", objNull, [objNull] ]
];

// Exit if no HCs present
if (isNull _HC1 && {isNull _HC2} && {isNull _HC3}) exitWith { PASS_AGAIN_AFTER_DELAY };


// Enable round-robin load balancing if more than one HC is present
private _loadBalance = false;
if ((!isNull _HC1 && !isNull _HC2) || {!isNull _HC1 && !isNull _HC3} || {!isNull _HC2 && !isNull _HC3}) then {
    _loadBalance = true;
};


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
if (_log) then {
    private _numHC1 = 0;
    private _numHC2 = 0;
    private _numHC3 = 0;
};


// Pass AI groups
private _numTransfered = 0;
{
    private _pass = true;

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
        if (vehicle _x != _x && {(vehicle _x) getVariable [QGVAR(blacklist), false]}) then {
            _pass = false;
        };
    } forEach (units _x);

    // No pass if group has already been passed
    if (_pass && {_x getVariable [QGVAR(passed), false]}) then {
        _pass = false;
    };

    // Round robin between HCs if load balance enabled, else pass all to one HC
    if (_pass) then {
        private _rc = false;

        if (_loadBalance) then {
            switch (_currentHC) do {
                case 1: {
                    _rc = _x setGroupOwner _HC1_ID;
                    if (_log) then {_numHC1 = _numHC1 + 1};
                    _currentHC = [3, 2] select (!isNull _HC2);
                };
                case 2: {
                    _rc = _x setGroupOwner _HC2_ID;
                    if (_log) then {_numHC2 = _numHC2 + 1};
                    _currentHC = [1, 3] select (!isNull _HC2);
                };
                case 3: {
                    _rc = _x setGroupOwner _HC3_ID;
                    if (_log) then {_numHC3 = _numHC3 + 1};
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
                    if (_log) then {_numHC1 = _numHC1 + 1};
                };
                case 2: {
                    _rc = _x setGroupOwner _HC2_ID;
                    if (_log) then {_numHC2 = _numHC2 + 1};
                };
                case 3: {
                    _rc = _x setGroupOwner _HC3_ID;
                    if (_log) then {_numHC3 = _numHC3 + 1};
                };
                default {
                    TRACE_1("No Valid HC to pass to",_currentHC);
                };
            };
        };

        // Count pass for statistics if successful
        if (_rc) then {
            _x setVariable [QGVAR(passed), true];
            _numTransfered = _numTransfered + 1;
        };
    };
} forEach allGroups;


// Print statistics
if (_log) then {
    private _numTotal = _numHC1 + _numHC2 + _numHC3;
    ACE_LOGINFO_5("Statistics",_numTransfered,_numHC1,_numHC2,_numHC3,_numTotal);
};

PASS_AGAIN_AFTER_DELAY
