#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Takes a kit (prepared on the website) from the player's locker into the box through the extension:
 * of each of its items as many as the locker has. Notifies the player when done.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Container <OBJECT>
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

params ["_player", "_container", "_kitID"];

private _playerID = getPlayerUID _player;

private _success = false;
if ((["lockerTakeKit", _kitID, _playerID] call FUNC(callServerExt)) == "ready") then {
    private _entries = [_playerID] call FUNC(lockerQueue);
    if (!isNil "_entries") then {
        {
            _x params ["_class", "_number", "_rounds"];
            [_container, _class, _number, true, _rounds] call FUNC(boxCargo);
        } forEach _entries;
        _success = true;
    };
};

// Notify Armory to refresh the kits (what the locker has now)
[QGVAR(lockerKitTaken), [_player, _success], _player] call CBA_fnc_targetEvent;
