#include "script_component.hpp"
/*
 * Author: Jonpas
 * Shows notifications to everyone in vicinity.
 *
 * Arguments:
 * 0: Texts (unlocalized) <ARRAY>
 * 1: Size <NUMBER>
 * 2: Include Caller <BOOL> (default: false)
 * 3: Vicinity Range <NUMBER> (default: 100)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["text", "STR_text"], 2.5] call tac_shootingrange_fnc_notifyVicinity;
 *
 * Public: No
 */

params ["_texts", "_size", ["_includeCaller", false], ["_vicinityRange", NOTIFY_DISTANCE, [0]] ];

private _nearbyPlayers = (getPosATL ACE_player) nearObjects ["CAManBase", _vicinityRange];

if (!_includeCaller) then {
    _nearbyPlayers deleteAt (_nearbyPlayers find ACE_player);
};

// Localize text locally
[QGVAR(notifyPlayer), [_texts, _size], _nearbyPlayers] call CBA_fnc_targetEvent;
