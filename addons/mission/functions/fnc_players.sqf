#include "..\script_component.hpp"
/*
 * Author: Mike
 * Alternative to CBA_fnc_players, removing people in spectator and pilots optionally being removed.
 *
 * Arguments:
 * 0: Skip Pilots <BOOL>
 *
 * Return Value:
 * Array of players
 *
 * Examples:
 * [] call MFUNC(players)
 * [true] call MFUNC(players)
 */

params [["_skipPilots", false]];

private _players = (call CBA_fnc_players) select {!(_x getVariable ["ace_spectator_isSet", false])};

if (_skipPilots) then {
    _players = _players select {isTouchingGround (vehicle _x)}; // Vehicle check is required otherwise it's inaccurate.
};

_players
