/*
 * Author: Jonpas
 * Shows notifications to everyone in vicinity.
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Size <NUMBER>
 * 2: Include Caller <BOOL> (default: false)
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

params ["_text", "_size", ["_includeCaller", false] ];

private _nearbyPlayers = (getPosATL ACE_player) nearObjects ["CAManBase", NOTIFY_DISTANCE];

if (_includeCaller) then {
    _nearbyPlayers pushBack ACE_player;
};

["displayTextStructured", _nearbyPlayers, [_text, _size]] call ACE_Common_fnc_targetEvent;
