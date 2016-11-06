/*
 * Author: TMF Team, Jonpas
 * Tests AI amount.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Findings <ARRAY>
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAIAmount
 *
 * Public: No
 */
#include "script_component.hpp"

private _findings = [];

private _aiAmount = allUnits - playableUnits;

if (_aiAmount > AI_AMOUNT_WARNING) then {
    if (_aiAmount > AI_AMOUNT_ERROR) then {
        _output pushBack [__ERROR, format [localize LSTRING(AIAmount), _aiAmount]];
    } else {
        _output pushBack [__WARNING, format [localize LSTRING(AIAmount), _aiAmount]];
    };
};

_findings
