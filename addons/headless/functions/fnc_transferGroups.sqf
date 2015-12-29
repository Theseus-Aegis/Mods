/*
 * Author: Jonpas
 * Transfers AI groups to Headess Client(s).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_headless_fnc_transferGroups;
 *
 * Public: No
 */
#include "script_component.hpp"

#define PASS_AGAIN_AFTER_DELAY [FUNC(transferGroups), [], GVAR(Delay)] call ACE_Common_fnc_waitAndExecute;


// Exit if no HCs present
if (GVAR(headlessClients) isEqualTo []) exitWith {
    PASS_AGAIN_AFTER_DELAY
    if (GVAR(Log)) then {
        ACE_LOGINFO("(Pass) No HCs Present");
    };
};

GVAR(headlessClients) params [
    ["_HC1", objNull, [objNull] ],
    ["_HC2", objNull, [objNull] ],
    ["_HC3", objNull, [objNull] ]
];

if (GVAR(Log)) then {
    ACE_LOGINFO_1("(Pass) Present HCs: %1",GVAR(headlessClients));
};


// Enable round-robin load balancing if more than one HC is present
private _loadBalance = [false, true] select (count GVAR(headlessClients) > 1);


// Get IDs and determine first HC to start with
private _idHC1 = -1;
private _idHC2 = -1;
private _idHC3 = -1;
private _currentHC = 0;

if (!isNull _HC1) then {
    _idHC1 = owner _HC1;
    _currentHC = 1;
};

if (!isNull _HC2) then {
    _idHC2 = owner _HC2;

    if (_currentHC == 0) then {
        _currentHC = 2;
    };
};

if (!isNull _HC3) then {
    _idHC3 = owner _HC3;

    if (_currentHC == 0) then {
        _currentHC = 3;
    };
};


// Prepare statistics
private _numTransferredHC1 = 0;
private _numTransferredHC2 = 0;
private _numTransferredHC3 = 0;


// Transfer AI groups
{
    private _transfer = true;

    // No transfer if empty group
    if (_x isEqualTo []) then {
        _transfer = false;
    };

    if (_transfer) then {
        {
            // No transfer if already transferred
            if ((owner _x) in [_idHC1, _idHC2, _idHC3]) exitWith {
                _transfer = false;
            };

            // No transfer if player in this group
            if (isPlayer _x) exitWith {
                _transfer = false;
            };

            // No transfer if any unit in group is blacklisted
            if (_x getVariable [QGVAR(blacklist), false]) exitWith {
                _transfer = false;
            };

            // No transfer if vehicle unit is in or crew in that vehicle is blacklisted
            if (vehicle _x != _x && {(vehicle _x) getVariable [QGVAR(blacklist), false]}) exitWith {
                _transfer = false;
            };
        } forEach (units _x);
    };


    // Round robin between HCs if load balance enabled, else pass all to one HC
    if (_transfer) then {
        switch (_currentHC) do {
            case 1: {
                private _transferred = _x setGroupOwner _idHC1;
                if (_loadBalance) then {
                    _currentHC = [3, 2] select (!isNull _HC2);
                };
                if (_transferred) then {
                    _numTransferredHC1 = _numTransferredHC1 + 1;};
            };
            case 2: {
                private _transferred = _x setGroupOwner _idHC2;
                if (_loadBalance) then {
                    _currentHC = [1, 3] select (!isNull _HC2);
                };
                if (_transferred) then {
                    _numTransferredHC2 = _numTransferredHC2 + 1;
                };
            };
            case 3: {
                private _transferred = _x setGroupOwner _idHC3;
                if (_loadBalance) then {
                    _currentHC = [2, 1] select (!isNull _HC2);
                };
                if (_transferred) then {
                    _numTransferredHC3 = _numTransferredHC3 + 1;
                };
            };
            default {
                TRACE_1("No Valid HC to pass to",_currentHC);
            };
        };
    };
} forEach allGroups;


if (GVAR(Log)) then {
    private _numTransferredTotal = _numTransferredHC1 + _numTransferredHC2 + _numTransferredHC3;
    ACE_LOGINFO_4("(Pass) Groups Transferred: Total: %1, HC1: %2, HC2: %3, HC3: %4",_numTransferredTotal,_numTransferredHC1,_numTransferredHC2,_numTransferredHC3);
};

PASS_AGAIN_AFTER_DELAY
