#include "..\script_component.hpp"
/*
 * Author: Mike
 *
 * Call on the server with isGlobal flag or locally without it.
 *
 * Arguments:
 * 0: Building <OBJECT>
 * 1: Door Index <ARRAY> (default: [])
 * 2: Lock State <NUMBER> (default: 1)
 * 2: Global <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [My_Building, [1, 2]] call MFUNC(lockDoors);
 * [My_Building, [1, 2, 3, 4], 0, false] call MFUNC(lockDoors);
*/

params ["_building", ["_doorIndex", []], ["_lockState", 1], ["_isGlobal", true]];

// If running globally, exit if not the server.
if (_isGlobal && !isServer) exitWith {};

// Exit if door index array is empty
if (_doorIndex isEqualTo []) exitWith {
    ERROR_MSG("Door Index is empty.");
};

// Check lockstate value is correct.
if !(_lockState in [0, 1]) exitWith {
    ERROR_MSG_1("Lock State is invalid (%1), expected 0 or 1.",_lockState);
};

{
    private _door = format ["BIS_Disabled_Door_%1", _x];
    _building setVariable [_door, _lockState, _isGlobal];
} forEach _doorIndex;
