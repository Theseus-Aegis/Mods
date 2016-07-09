/*
 * Author: Jonpas
 * Handles loadout change. Saves player after 10 second delay if delay not already running.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Old Loadout <ARRAY> (unused)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, corpse] call tac_apollo_fnc_handleLoadoutChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

// Only save if not remote controlling a unit and more than 10 seconds have passed from previous save
if (_player != player || {isNull _player} || {!alive _player} || {_player getVariable [QGVAR(inSaveDelay), false]}) exitWith {};

// Mark saving delay running
_player setVariable [QGVAR(inSaveDelay), true];

[{
    params ["_player"];

    // Exit if things changed during delay
    if (isNull _player || {!alive _player}) exitWith {};

    [QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;

    // Mark saving delay ended
    _player setVariable [QGVAR(inSaveDelay), false];
}, [_player], _delay] call CBA_fnc_waitAndExecute;
