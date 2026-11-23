#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Reads the website's reply to a locker request (lockerAction, lockerTakeKit) from the extension:
 * what to add to the box, as data ([class, count, rounds] each, rounds -1 for full).
 *
 * Arguments:
 * 0: Player UID <STRING>
 *
 * Return Value:
 * Entries <ARRAY>, nil if the request failed
 *
 * Example:
 * ["76561198000000001"] call tac_apollo_fnc_lockerQueue
 *
 * Public: No
 */

params ["_playerID"];

private _entries = [];
private _failed = false;
while {true} do {
    private _reply = ["retrieveLockerQueue", _playerID] call FUNC(callServerExt);
    if (_reply == "done") exitWith {};
    if (_reply == "error") exitWith {
        _failed = true;
    };
    _entries pushBack (parseSimpleArray _reply);
};

if (_failed) exitWith {nil};
_entries
