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

// Don't load when UID is "_SP_PLAYER_" (singleplayer/editor)
if (getPlayerUID _player == "_SP_PLAYER_") exitWith {false};

private _result = ["loadPlayer", [getPlayerUID _player, GVAR(isDebug)]] call FUNC(callExt);

if (!isNil "_result") then {
    _result params [["_dir", -1], ["_posASL", []], ["_loadout", []]];

    if (_dir != -1) then {
        _player setDir _dir;
    };
    if (_posASL isNotEqualTo [] && {count _posASL == 3}) then {
        _player setPosASL _posASL;
    };
    _player setUnitLoadout _loadout;
    _player setDamage 0;

    // Goggles bandaid (#283 - vanilla bug) - setUnitLoadout does not properly set goggles (like dragging in inventory would)
    private _goggles = goggles _player;
    if (_goggles != "") then {
        // Only use addGoggles if not empty (prevents RPT message)
        _player addGoggles _goggles;
    };

    // Validate
    // Delay to allow Arma server to get the new loadout before attempting to validate
    // Validation does nothing at this moment as it was never properly implemented in the backend
    // This is also used to load runtime (current mission run) data
    [{
        [QGVAR(savePlayer), [_this, profileName, "validate"]] call CBA_fnc_serverEvent;
    }, _player, 1] call CBA_fnc_waitAndExecute;

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
