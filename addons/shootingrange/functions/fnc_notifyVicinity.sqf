/*
 * Author: Jonpas
 * Shows notifications to everyone in vicinity.
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Size <NUMBER>
 * 2: Include Caller <BOOL> (default: false)
 * 3: Vicinity Range <NUMBER> (default: 100)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Notification", 2.5] call tac_shootingrange_fnc_notifyVicinity;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_text", "_size", ["_includeCaller", false], ["_vicinityRange", NOTIFY_DISTANCE, [0]] ];

private _nearbyPlayers = (getPosATL ACE_player) nearObjects ["CAManBase", _vicinityRange];

if (!_includeCaller) then {
    _nearbyPlayers deleteAt (_nearbyPlayers find ACE_player);
};

["ace_common_displayTextStructured", [_text, _size], _nearbyPlayers] call CBA_fnc_targetEvent;
