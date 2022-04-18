#include "script_component.hpp"
/*
 * Author: Jonpas, JoramD
 * Get player based info from Athena. Currently supports: "getTrainingIdentifiers" & "getAccessibleItemClasses".
 *
 * Arguments:
 * 0: Requested Data <STRING>
 * 1: Player <OBJECT>
 * 2: Custom Error Message <STRING> (default: "Could not load info")
 *
 * Return Value:
 * Requested Info <ARRAY>
 *
 * Example:
 * ["getAccessibleItemClasses", _player] call tac_apollo_fnc_getPlayerInfo
 *
 * Public: No
 */

params ["_type", "_player", ["_errorMessage", "Could not load info"]];

if !(_type in ["getTrainingIdentifiers", "getAccessibleItemClasses"]) exitWith {
    ERROR_1("Type %1 is not supported",_type);
    []
};

private _playerUID = getPlayerUID _player;

if (_playerUID isEqualTo "_SP_PLAYER_" || {_playerUID isEqualto "_SP_AI_"}) exitWith {
    ERROR("getPlayerInfo only works in (locally hosted) MP");
    []
};

private _loadData = "tac_apollo_client" callExtension [_type, [_playerUID]];

_loadData params ["_result", "_returnCode", "_errorCode"];
if (_result == "queued" && {_returnCode == 0} && {_errorCode == 0}) then {
    _result = [] call FUNC(handleExtMultipartReturn);
};

if (_returnCode == 0 && {_errorCode == 0} && {_result != "error"}) then {
    private _requestedInfo = parseSimpleArray _result;
    TRACE_1("Player Info",_requestedInfo);
    _requestedInfo
} else {
    ERROR_4("Failed to load info (Name: %1 - UID: %2) [return: %3, error: %4]!",profileName,_playerUID,_returnCode,_errorCode);
    [_errorMessage] call CBA_fnc_notify;
    []
};
