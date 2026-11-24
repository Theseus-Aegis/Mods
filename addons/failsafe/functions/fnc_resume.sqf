#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Resumes the flight of the frozen aircraft the player is in, after a short countdown to get
 * ready (ACE progress bar), as its pilot or co-pilot.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_failsafe_fnc_resume
 *
 * Public: No
 */

[
    3,
    [objectParent ACE_player],
    {
        (_this select 0) params ["_vehicle"];
        [QGVAR(resume), [_vehicle, ACE_player]] call CBA_fnc_serverEvent;
    },
    {},
    LLSTRING(Resuming),
    {call FUNC(canResume)},
    ["isNotInside"]
] call ACEFUNC(common,progressBar);
