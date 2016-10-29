/*
 * Author: alganthe
 * Prepare the player for the Apollo extension loading and calls extension loading.
 * Add inventory one frame after removing initial inventory to prevent possible inventory desync.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Load type ("loaded" or "respawned") <STRING> (default: "loaded")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "loaded"] call tac_apollo_fnc_startPlayerLoadClient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", ["_loadType", "loaded"]];

_player allowDamage false;
_player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];

[{
    _this call FUNC(playerLoadClient);
}, [_player, _loadType]] call CBA_fnc_execNextFrame;
