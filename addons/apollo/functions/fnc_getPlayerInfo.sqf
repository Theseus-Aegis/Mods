#include "script_component.hpp"
/*
 * Author: Jonpas, JoramD
 * Get player based info from Athena. Currently supports: "getTrainingIdentifiers" & "getAccessibleItemClasses".
 *
 * Arguments:
 * 0: Requested Data <STRING>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Requested Info <ARRAY>
 *
 * Example:
 * ["getAccessibleItemClasses", _player] call tac_apollo_fnc_getPlayerInfo
 *
 * Public: No
 */

params ["_type", "_player"];

if !(_type in ["getTrainingIdentifiers", "getAccessibleItemClasses"]) exitWith {
    ERROR_1("Type %1 is not supported", _type);
};

private _playerUID = getPlayerUID _player;

if (_playerUID isEqualTo "_SP_PLAYER_" || {_playerUID isEqualto "_SP_AI_"}) exitWith {
    ERROR("getPlayerInfo only works in (locally hosted) MP")
};

private _requestedInfo = [];

TRACE_1("Loading Client",_player);
private _success = false;

private _loadData = "tac_apollo_client" callExtension format ["%1%2", _type, _playerUID];
TRACE_1("Load Data Start",_loadData);

if (_loadData == "loaded") then {
    private _updateInfo = true;
    while {_updateInfo} do {
        private _loadData = "tac_apollo_client" callExtension "get";
        TRACE_1("Load Data",_loadData);

        if (_loadData == "error") then {
            // Bad things happened, stop executing
            _updateInfo = false;
        } else {
            if (_loadData == "done") then {
                // Initialization complete
                _updateInfo = false;
                _success = true;
            } else {
                // Add data to array
                _requestedInfo pushBack _loadData;
            };
        };
    };
};

if !(_success) exitWith {
    ERROR_2("Failed to load info (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
    ["Could not load info"] call CBA_fnc_notify;
};

_requestedInfo
