#include "..\script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Calculates time until start, different values for server and clients.
 *
 * Call from initServer & initPlayerLocal
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call MFUNC(timeUntilStart)
 */

systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 14; // 1400z always

private _timeUntilStart = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
_timeUntilStart = _timeUntilStart max 0;

// Global server variant.
if (isServer) then {
    tac_scripts_timeUntilStart = _timeUntilStart;
    publicVariable "tac_scripts_timeUntilStart";
};

// Local variant to update for players joining after mission start.
if (hasInterface) then {
    tac_scripts_timeUntilStartPlayer = _timeUntilStart;
};
