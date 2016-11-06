/*
 * Author: TMF Team, Jonpas
 * Tests init fields of objects.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testInit
 *
 * Public: No
 */
#include "script_component.hpp"

private _output = [];
{
    (_x get3DENAttribute 'Init') params ["_init", ""];
    _init = toLower _init;

    private _count = count _init;
    private _VA = _init find "exported from arsenal" != -1;
    private _isServer = _init find "isserver" != -1;
    private _isLocal = _init find "local" != -1;

    switch (true) do {
        case (_count < 50): {};
        case (_count < 150): {
            if (!_isServer && {!_isLocal}) then {
                _output pushBack [__WARNING, format [localize LSTRING(LargeInitField), _x, _count]];
            };
        };
        // >= 150
        default {
            // check _VA
            if (_VA) then {
                if (_isServer || {_isLocal}) then {
                    _output pushBack [__WARNING, format [localize LSTRING(VirtualArsenalCodeDetected), _x]];
                } else {
                    _output pushBack [__ERROR, format [localize LSTRING(VirtualArsenalCodeDetectedAndNoChecks), _x]];
                };
            } else {
                if (!_isServer && {!_isLocal}) then {
                    _output pushBack [__WARNING, format [localize LSTRING(LargeInitField), _x, _count]];
                };
            };
        };
    };
} forEach (all3DENEntities select 0);

_output pushBack [_PASS, format [localize LSTRING(InitFieldCheckCompleted), count _output]];

_output
