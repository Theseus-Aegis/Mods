/*
 * Author: Jonpas
 * Parses locker action through extension.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Type <STRING>
 * 2: Container <OBJECT>
 * 3: Item Class Name <STRING>
 * 4: Quantity <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "rifle", box, "weapon", "5"] call tac_apollo_fnc_lockerAction
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_type", "_container", "_itemClass", "_quantity"];

private _playerID = getPlayerUID _player;

private _serverReply = ["lockerAction", _type, _playerID, _itemClass, _quantity] call FUNC(invokeJavaMethod);

if (_serverReply == "ready") then {
    // Load packages for execution of commands
    private _responsePacket = [];
    private _updateInfo = true;

    while {_updateInfo} do {
        private _serverReply = ["retrieveLockerQueue", _playerID] call FUNC(invokeJavaMethod);

        if (_serverReply == "done") then {
            {
                call _x;
            } forEach _responsePacket;

            _responsePacket = [];
            _updateInfo = false;
        } else {
            _responsePacket pushBack (compile _serverReply);
        };
    };
};
