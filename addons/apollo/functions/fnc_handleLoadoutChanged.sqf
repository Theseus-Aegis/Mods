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
TRACE_1("Loadout Changed",_player);

// Only save if not remote controlling a unit and more than 10 seconds have passed from previous save
if (_player != player || {isNull _player} || {!alive _player} || {(_player getVariable [QGVAR(lastSavedTime), 0]) + 10 > CBA_missionTime}) exitWith {
    TRACE_1("Loadout Changed - Not Saving",CBA_missionTime);
};

// Prevent more save calls while delay is running
_player setVariable [QGVAR(lastSavedTime), CBA_missionTime];

[{
    params ["_player"];

    // Exit if things changed during delay
    if (isNull _player || {!alive _player}) exitWith {
        TRACE_3("Loadout Changed - Exiting Delay",_player,isNull _player,alive _player);
    };

    [QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;
    TRACE_1("Loadout Changed - Saving Done",_player);

    // Mark last save
    _player setVariable [QGVAR(lastSavedTime), CBA_missionTime];
}, [_player], SAVE_DELAY] call CBA_fnc_waitAndExecute;
