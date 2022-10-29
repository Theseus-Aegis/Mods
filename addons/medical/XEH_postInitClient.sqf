#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["ace_medical_FatalInjury", {
    params ["_unit"];

    if (!GVAR(fatalInjuriesCardiacArrestTimeCoefficient)) exitWith {};

    if (!isPlayer _unit && {ACEGVAR(medical_statemachine,fatalInjuriesAI) == 0}) exitWith {LOG("FatalInjury - skipping AI with fatalInjuriesAI=0")};
    if (ACEGVAR(medical_statemachine,fatalInjuriesPlayer) == 0) exitWith {LOG("FatalInjury - skipping Player with fatalInjuriesPlayer=0")};

    LOG("FatalInjury - waiting 1 second");
    // Give some time to allow state machine to handle it first
    // This should keep 10% possible variance in cardiac arrest time from ACE, we just cut it proportionally
    [{
        params ["_unit"];

        LOG("FatalInjury - check condition");
        private _timeLeft = _unit getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", -1];
        private _lastUpdate = _unit getVariable ["tac_medical_cardiacArrestLastUpdate", -1];

        if (_timeLeft > 0 && {_lastUpdate + 1 < CBA_missionTime}) then {
            LOG("FatalInjury - apply");
            _unit setVariable ["tac_medical_cardiacArrestLastUpdate", CBA_missionTime];
            _unit setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", _timeLeft * GVAR(fatalInjuriesCardiacArrestTimeCoefficient)]; // 5min -> 1min (example)
        } else {
            TRACE_2("FatalInjury - skipping",_timeLeft,_lastUpdate);
        };
    }, _unit, 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
