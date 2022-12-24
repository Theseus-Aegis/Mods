#include "script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Sets up Auto-AAR (type and time based) and Manual-AAR (event for chat command) functionalities.
 * Call from initServer.sqf.
 *
 * Arguments:
 * 0: Time until start (in seconds) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [3600] call MFUNC(aar)
 */

params [["_timeUntilStart", 0]];

if !(["OCAP"] call ACEFUNC(common,isModLoaded)) exitWith {
    WARNING("AAR disabled - OCAP not loaded!");
};

// Functions
FUNC(canStartAAR) = {
    isNil "ocap_capture" || {!ocap_capture}
};
FUNC(canStopAAR) = {
    !isNil "ocap_capture" && {ocap_capture}
};
FUNC(startAAR) = {
    [] call ocap_fnc_init;
    [QACEGVAR(common,systemChatGlobal), "AAR Started"] call CBA_fnc_globalEvent;
};
FUNC(stopAAR) = {
    private _missionType = getMissionConfigValue ["tac_type", -1];
    private _missionTypePretty = MISSION_TYPES select _missionType;
    [sideAmbientLife, "", _missionTypePretty] call ocap_fnc_exportData; // side must be given
    INFO_2("AAR stopped with type %1 '%2'",_missionType,_missionTypePretty);
    [QACEGVAR(common,systemChatGlobal), "AAR Stopped"] call CBA_fnc_globalEvent;
};

// Auto-AAR (only non-Gimmick)
GVAR(disableAutoAAR) = false;
if (_missionType in AUTOAAR_TYPES) then {
    INFO_1("Auto-AAR waiting for start [type: %1]",_missionType);
    [{
        [{
            params ["_args", "_handle"];

            if (GVAR(disableAutoAAR)) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
                INFO("Auto-AAR disabled");
            };

            private _playerCount = count (call CBA_fnc_players);

            if (call FUNC(canStartAAR) && {_playerCount >= AUTOAAR_PLAYER_COUNT}) exitWith {
                call FUNC(startAAR);
                INFO_1("Auto-AAR started [players: %1]",_playerCount);
            };

            if (call FUNC(canStopAAR) && {_playerCount < AUTOAAR_PLAYER_COUNT}) exitWith {
                call FUNC(stopAAR);
                INFO_1("Auto-AAR stopped [players: %1]",_playerCount);
            };
        }, 60, []] call CBA_fnc_addPerFrameHandler;
    }, [], _timeUntilStart] call CBA_fnc_waitAndExecute;
};

// Manual-AAR
[QGVAR(manualAAR), {
    params ["_executor"];

    if (call FUNC(canStartAAR)) then {
        call FUNC(startAAR);
        INFO_1("Manual-AAR started [executor: %1]",_executor);
    } else {
        if (call FUNC(canStopAAR)) then {
            if (!GVAR(disableAutoAAR)) then {
                INFO_1("Auto-AAR running - converting to Manual-AAR [executor: %1]",_executor);
                [QACEGVAR(common,systemChatGlobal), "AAR running - stop again to confirm", _executor] call CBA_fnc_targetEvent;
            } else {
                call FUNC(stopAAR);
                INFO_1("Manual-AAR stopped [executor: %1]",_executor);
            };
        };
    };

    GVAR(disableAutoAAR) = true;
}] call CBA_fnc_addEventHandler;

// Handle mission ending
addMissionEventHandler ["MPEnded", {
    if (call FUNC(canStopAAR)) then {
        call FUNC(stopAAR);
    };
}];
