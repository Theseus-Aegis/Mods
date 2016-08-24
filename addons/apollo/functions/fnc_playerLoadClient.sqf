/*
 * Author: Jonpas
 * Loads player using ApolloClient extension.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Successfully Loaded <BOOL>
 *
 * Example:
 * _success = [player] call tac_apollo_fnc_playerLoadClient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

_player allowDamage false;
["ace_common_enableSimulationGlobal", [_player, false]] call CBA_fnc_serverEvent;
["ace_common_hideObjectGlobal", [_player, true]] call CBA_fnc_serverEvent;
removeHeadgear _player:
removeGoggles _player;
removeVest _player;
removeBackpack _player;
removeUniform _player;
removeAllWeapons _player:
removeAllAssignedItems _player;

TRACE_1("Loading Client",_player);
private _return = false;

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
                _updateInfo = false;

                // Validate
                [QGVAR(savePlayer), [_player, "validate"]] call CBA_fnc_serverEvent;

                // Has to be executed where unit is local
                _player allowDamage true;

                // Initialization complete
                _return = true;
            } else {
                _codePacket = _loadData select [17, count _loadData];
                //TRACE_1("Code Packet",_codePacket);
                call (compile _codePacket);
            };
        };
    };
};

_return
