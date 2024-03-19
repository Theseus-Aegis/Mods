#include "..\script_component.hpp"
/*
 * Author: Mike
 * Wrapper of CBA_fnc_players, removing players in spectator and optionally any units in the air.
 *
 * Arguments:
 * 0: Skip units in the air <BOOL>
 *
 * Return Value:
 * Players <ARRAY>
 *
 * Examples:
 * [] call MFUNC(players)
 * [true] call MFUNC(players)
 */

params [["_skipInAir", false]];

private _players = (call CBA_fnc_players) select {!(_x getVariable [QACEGVAR(spectator,isSet), false])};

if (_skipInAir) then {
    _players = _players select {isTouchingGround (vehicle _x)}; // Check vehicle, not the unit
};

_players
