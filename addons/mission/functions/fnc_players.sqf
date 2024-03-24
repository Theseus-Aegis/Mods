#include "..\script_component.hpp"
/*
 * Author: Mike
 * Wrapper of CBA_fnc_players, removing players in spectator
 * and optionally any units not touching the ground (eg. in the air/water).
 *
 * Arguments:
 * 0: Skip units not touching the ground <BOOL>
 *
 * Return Value:
 * Players <ARRAY>
 *
 * Examples:
 * [] call MFUNC(players)
 * [true] call MFUNC(players)
 */

params [["_skipNotGround", false]];

private _players = (call CBA_fnc_players) select {!(_x getVariable [QACEGVAR(spectator,isSet), false])};

if (_skipNotGround) then {
    _players = _players select {isTouchingGround (vehicle _x)}; // Check vehicle, not the unit
};

_players
