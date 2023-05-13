#include "script_component.hpp"
/*
 * Author: Mike
 * Change side relations for 2 sides.
 * Values are 0 to 1, 0 being enemy and 1 being friendly. Values smaller than 0.6 results in enemy.
 *
 * Call from initServer
 *
 * Arguments:
 * 0: Side One <SIDE> (default: west)
 * 1: Side Two <SIDE> (default: resistance)
 * 2: Value <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, resistance] call MFUNC(sideRelations)
 * [east, resistance, 1] call TAC_Mission_fnc_sideRelations
*/

params [["_sideOne", west], ["_sideTwo", resistance], ["_value", 0]];

if (!isServer) exitWith {};

_sideOne setFriend [_sideTwo, _value];
_sideTwo setFriend [_sideOne, _value];
