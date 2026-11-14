#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Takes a kit (prepared on the website) from the player's locker into the box through the extension:
 * of each of its items as many as the locker has. Notifies the player when done.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Container <OBJECT> (used by Apollo backend for item addition - DO NOT REMOVE)
 * 2: Kit ID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, box, "12"] call tac_apollo_fnc_lockerTakeKit
 *
 * Public: No
 */

// IGNORE_PRIVATE_WARNING(_container) - DO NOT REMOVE - Used by Apollo backend for item addition
params ["_player", "_container", "_kitID"];

private _playerID = getPlayerUID _player;

private _serverReply = ["lockerTakeKit", _kitID, _playerID] call FUNC(callServerExt);

private _success = false;
if (_serverReply == "ready") then {
    private _responsePacket = [];
    private _updateInfo = true;

    while {_updateInfo} do {
        private _serverReply = ["retrieveLockerQueue", _playerID] call FUNC(callServerExt);

        if (_serverReply == "done") then {
            {
                call _x;
            } forEach _responsePacket;
            _success = true;
            _updateInfo = false;
        } else {
            if (_serverReply == "error") then {
                _updateInfo = false;
            } else {
                _responsePacket pushBack (compile _serverReply);
            };
        };
    };
};

// Notify Armory to refresh the kits (what the locker has now)
[QGVAR(lockerKitTaken), [_player, _success], _player] call CBA_fnc_targetEvent;
