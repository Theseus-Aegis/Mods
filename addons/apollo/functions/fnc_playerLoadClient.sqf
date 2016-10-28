/*
 * Author: Jonpas
 * Loads player using ApolloClient extension.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call tac_apollo_fnc_playerLoadClient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

TRACE_1("Loading Client",_player);
private _success = false;

// Don't load when UID is "_SP_PLAYER_" (singleplayer/editor)
if (getPlayerUID _player == "_SP_PLAYER_") exitWith {false};

private _loadData = "ApolloClient" callExtension format ["%1%2/%3", "loadPlayer", getPlayerUID _player, GVAR(isDebug)];
if (_loadData == "loaded") then {
    private _updateInfo = true;
    while {_updateInfo} do {
        private _loadData = "ApolloClient" callExtension "get";
   	    //TRACE_1("Load Data",_loadData);

        if (_loadData == "error") then {
            // Bad things happend, stop executing
            _updateInfo = false;
        } else {
            if (_loadData == "done") then {
                // Initialization complete
                _updateInfo = false;
                _success = true;
            } else {
                _codePacket = _loadData select [17, count _loadData];
                //TRACE_1("Code Packet",_codePacket);
                call (compile _codePacket);
            };
        };
    };
};

if (_success) then {
    // Validate
    [QGVAR(savePlayer), [_player, "validate"]] call CBA_fnc_serverEvent;

    // Has to be executed where unit is local
    _player allowDamage true;

    // Allow saving and save load time to prevent instant saving after load
    _player setVariable [QGVAR(lastSavedTime), CBA_missionTime];

    // Save on each inventory change and periodically with a delay between each save
    ["loadout", FUNC(playerSaveClient)] call CBA_fnc_addPlayerEventHandler;
    [FUNC(playerSaveClient), [_player, [], true], SAVE_DELAY_PERIODIC] call CBA_fnc_waitAndExecute;

    true
} else {
    ERROR_2("Player not successfully loaded (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
    ["Your connection has been terminated - Error during Chronos loading!"] call FUNC(endMissionError);

    false
};
