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

private _result = [_type, [_playerUID]] call FUNC(callExt);

if (!isNil "_result") then {
    _result
} else {
    ERROR_2("Failed to load info (Name: %1 - UID: %2)!",profileName,_playerUID);
    [_errorMessage] call CBA_fnc_notify;
    []
};
