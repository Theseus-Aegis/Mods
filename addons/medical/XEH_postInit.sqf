#include "script_component.hpp"

["ace_medical_FatalInjury", {
    params ["_unit"];

    if (GVAR(fatalInjuriesCardiacArrestTimeCoefficient) == 1) exitWith {LOG("FatalInjury - skipping as coefficient of 1 does not cause any change")};

    if (!isPlayer _unit && {ACEGVAR(medical_statemachine,fatalInjuriesAI) == 0}) exitWith {LOG("FatalInjury - skipping AI with fatalInjuriesAI=0")};
    if (isPlayer _unit && {ACEGVAR(medical_statemachine,fatalInjuriesPlayer) == 0}) exitWith {LOG("FatalInjury - skipping Player with fatalInjuriesPlayer=0")};

    LOG("FatalInjury - waiting 1 second");
    // Give some time to allow state machine to handle it first
    // This should keep 10% possible variance in cardiac arrest time from ACE, we just cut it proportionally
    [{
        params ["_unit"];

        LOG("FatalInjury - check condition");
        private _timeLeft = _unit getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", -1];
        private _lastUpdate = _unit getVariable ["tac_medical_cardiacArrestLastUpdate", -1];

        if (_timeLeft > 0 && {_lastUpdate + 1 < CBA_missionTime}) then {
            private _reducedTimeLeft = _timeLeft * GVAR(fatalInjuriesCardiacArrestTimeCoefficient); // 5min -> 1min (example)
            _unit setVariable ["tac_medical_cardiacArrestLastUpdate", CBA_missionTime];
            _unit setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", _reducedTimeLeft];

            private _medicalState = [_unit] call ACEFUNC(medical,serializeState);
            INFO_3("FatalInjury intercepted (cardiac arrest time reduced from %1 to %2). Serialized medical state: %3",_timeLeft,_reducedTimeLeft,_medicalState);
        } else {
            TRACE_2("FatalInjury - skipping",_timeLeft,_lastUpdate);
        };
    }, _unit, 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
