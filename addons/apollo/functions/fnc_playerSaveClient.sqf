/*
 * Author: Jonpas
 * Saves a player every 10 seconds.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call tac_apollo_fnc_playerSaveClient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

[{
    if (!isNull _player) then {
        [QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;
    };
}, 10, []] call CBA_fnc_addPerFrameHandler;
