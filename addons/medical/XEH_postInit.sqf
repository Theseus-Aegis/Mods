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

            // Log state
            INFO_2("FatalInjury intercepted (cardiac arrest time reduced from %1 to %2).",_timeLeft,_reducedTimeLeft);
            private _medicalState = [_unit] call ACEFUNC(medical,serializeState);
            _medicalState = _medicalState call CBA_fnc_removeWhitespace;

            if (count _medicalState < 1000) then {
                INFO_1("FatalInjury State: %1",_medicalState);
            } else {
                // Split if necessary (diag_log is limited to 1044 characters)
                // Parts from https://github.com/CBATeam/CBA_A3/blob/d64453d4ec032fc07c9e615fa41f7990010f1918/addons/diagnostic/fnc_debug.sqf
                private _medicalStateSplit = [];
                while {count _medicalState > 0} do {
                    _medicalStateSplit pushBack (_medicalState select [0, 1000]);
                    _medicalState = _medicalState select [1000];
                };

                {
                    INFO_3("FatalInjury State (%1/%2): %3",_forEachIndex + 1,count _medicalStateSplit,_x);
                } forEach _medicalStateSplit;
            };
        } else {
            TRACE_2("FatalInjury - skipping",_timeLeft,_lastUpdate);
        };
    }, _unit, 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

// Unconscious Moaning
if (isServer) then {
    ["ace_unconscious", {
        params ["_unit", "_state"];

        if !(GVAR(unconsciousFXEnabled)) exitWith {};

        if (isPlayer _unit && _state) then {
            // Knock out sound
            private _knockOutNoise = selectRandom KO_NOISES;
            [QEGVAR(mission,say3D), [_unit, _knockOutNoise]] call CBA_fnc_globalEvent;

            // Local PFH for periodic groaning
            [QGVAR(unconsciousFX), [], _unit] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(unconsciousFx), LINKFUNC(unconsciousFX)] call CBA_fnc_addEventHandler;
