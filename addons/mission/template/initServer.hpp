// Included from initServer.hpp in mission template.

#define MISSION_TYPES ["Contract", "Non-Contract", "Training", "Special", "PvP", "Gimmick"]

// Mathematical Heresy
systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 14; // 1400z always
private _timeUntilStart = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
_timeUntilStart = _timeUntilStart max 0;
INFO_1("Time Until Start: %1",_timeUntilStart);

// Verify mission type is correct
private _missionType = getMissionConfigValue ["tac_type", -1];
if (_missionType == -1 || {_missionType >= count MISSION_TYPES}) exitWith {
    ERROR_WITH_TITLE_2("Invalid mission type %1!","Expected 0-%2",_missionType,count _missionTypes - 1);
};

// AAR
[_timeUntilStart] call MFUNC(aar);

// Mission Name call on mission start
[{
    [QGVAR(missionName), []] call CBA_fnc_globalEvent;
}, [], _timeUntilStart + 60] call CBA_fnc_waitAndExecute;

// Unit Counter Tool - Target Watch: `call TAC_Scripts_fnc_monitorUnits`
FUNC(monitorUnits) = {
    format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", west countSide allUnits, east countSide allUnits, resistance countside allUnits, civilian countSide allUnits, count playableUnits]
};
