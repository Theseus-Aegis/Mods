/*
 * Author: TMF Team, Jonpas
 * Tests init fields of objects.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Findings <ARRAY>
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testInit
 *
 * Public: No
 */
#include "script_component.hpp"

private _findings = [];
{
    (_x get3DENAttribute 'Init') params ["_init", ""];
    _init = toLower _init;

    private _count = count _init;
    private _virtualArsenal = _init find "exported from arsenal" != -1;
    private _isServer = _init find "isserver" != -1;
    private _isLocal = _init find "local" != -1;

    switch (true) do {
        case (_count < INIT_SIZE_WARNING): {};
        case (_count < INIT_SIZE_ERROR): {
            if (!_isServer && {!_isLocal}) then {
                _findings pushBack [WARNING_CODE, format [localize LSTRING(LargeInitField), _x, _count]];
            };
        };
        // >= 150
        default {
            // check Virtual Arsenal
            if (_virtualArsenal) then {
                if (_isServer || {_isLocal}) then {
                    _findings pushBack [WARNING_CODE, format [localize LSTRING(VirtualArsenalCodeDetected), _x]];
                } else {
                    _findings pushBack [ERROR_CODE, format [localize LSTRING(VirtualArsenalCodeDetectedAndNoChecks), _x]];
                };
            } else {
                if (!_isServer && {!_isLocal}) then {
                    _findings pushBack [WARNING_CODE, format [localize LSTRING(LargeInitField), _x, _count]];
                };
            };
        };
    };
} forEach (all3DENEntities select 0);

_findings pushBack [MESSAGE_CODE, format [localize LSTRING(InitFieldCheckCompleted), count _findings]];

_findings
