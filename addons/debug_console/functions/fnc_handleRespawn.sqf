#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles respawn of players.
 *
 * Arguments:
 * 0: New Unit <OBJECT>
 * 1: Old Unit <OBJECT> (Unused)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_newUnit", "_oldUnit"];

if (GVAR(playerCurators) isEqualTo []) exitWith {};

private _playerUID = getPlayerUID _newUnit;
private _moduleData = GVAR(playerCurators) select {_playerUID in _x};

if (_moduleData isEqualTo []) exitWith {};

// Break old curator assignment
private _module = (_moduleData select 0) select 0;
unassignCurator _module;

// Reassign curator back to original player
_newUnit assignCurator _module;
