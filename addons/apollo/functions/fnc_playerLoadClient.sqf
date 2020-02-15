#include "script_component.hpp"
/*
 * Author: Jonpas
 * Loads player using ApolloClient extension.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Load Type ("loaded" or "respawned") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "loaded"] call tac_apollo_fnc_playerLoadClient
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL

params ["_player", "_loadType"];

_player allowDamage false;

TRACE_1("Loading Client",_player);
private _success = false;

// Don't load when UID is "_SP_PLAYER_" (singleplayer/editor)
if (getPlayerUID _player == "_SP_PLAYER_") exitWith {false};

private _loadData = "tac_apollo_client" callExtension format ["%1%2/%3", "loadPlayer", getPlayerUID _player, GVAR(isDebug)];
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
                private _codePacket = _loadData select [17, count _loadData];
                TRACE_1("Code Packet",_codePacket);
                call (compile _codePacket);
            };
        };
    };
};

if (_success) then {
    // Goggles bandaid (#283 - vanilla bug) - setUnitLoadout does not properly set goggles (like dragging in inventory would)
    private _goggles = goggles _player;
    if (_goggles != "") then {
        // Only use addGoggles if not empty (prevents RPT message)
        _player addGoggles _goggles;
    };

    // Validate
    [QGVAR(savePlayer), [_player, "validate"]] call CBA_fnc_serverEvent;

    // Has to be executed where unit is local
    _player allowDamage true;

    // Allow saving and save load time to prevent instant saving after load
    _player setVariable [QGVAR(lastSavedTime), CBA_missionTime, true];

    // Save on each inventory change and periodically with a delay between each save
    ["loadout", {
        params ["_unit"];
        [_unit] call FUNC(playerSaveClient);
    }] call CBA_fnc_addPlayerEventHandler;
    [FUNC(playerSaveClient), [_player, true], SAVE_DELAY_PERIODIC] call CBA_fnc_waitAndExecute;

    INFO_1("Client %1 successfully.",_loadType);
} else {
    ERROR_2("Player load failed (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
    ["Your connection has been terminated - Error during Chronos loading!"] call FUNC(endMissionError);
};
