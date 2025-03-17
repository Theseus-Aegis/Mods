#include "..\script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Calculates time until start at 14:00z
 *
 * Call from initServer & initPlayerLocal
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Time until start <NUMBER>
 *
 * Example:
 * [] call MFUNC(timeUntilStart)
 */

systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 14; // 1400z always

private _timeUntilStart = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
_timeUntilStart = _timeUntilStart max 0;

_timeUntilStart
