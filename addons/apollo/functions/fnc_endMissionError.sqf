#include "script_component.hpp"
/*
 * Author: Jonpas
 * Ends mission with error message on client.
 *
 * Arguments:
 * 0: Error Message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Error"] call tac_apollo_fnc_endMissionError
 *
 * Public: No
 */

params ["_errorMessage"];

titleText ["", "BLACK IN", 0];
titleText [_errorMessage, "black"];
titleFadeOut 9999;

[{
    ["end1", false, 0] call BIS_fnc_endMission;
}, [], 5] call CBA_fnc_waitAndExecute;
