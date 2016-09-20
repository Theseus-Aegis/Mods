/*
 * Author: Jonpas
 * Handles loadout change and periodic saves. Requests a save of the player after a delay.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Old Loadout <ARRAY> (unused)
 * 2: Periodic Save <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [], false] call tac_apollo_fnc_playerSaveClient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "", ["_periodic", false]];
TRACE_1("Player Save Client",_this);

// Call next periodic save
if (_periodic) then {
    [FUNC(playerSaveClient), [_player, [], _periodic], SAVE_DELAY_PERIODIC] call CBA_fnc_waitAndExecute;
};

// Only save if not remote controlling a unit and more than 10 seconds have passed from previous save
private _delay = [SAVE_DELAY_INV_CHANGE, SAVE_DELAY_PERIODIC] select _periodic;
if (_player != player || {isNull _player} || {!alive _player} || {(_player getVariable [QGVAR(lastSavedTime), CBA_missionTime]) + _delay > CBA_missionTime}) exitWith {
    TRACE_1("Save - Not Saving",CBA_missionTime);
};

[QGVAR(savePlayer), [_player, "save"]] call CBA_fnc_serverEvent;
TRACE_1("Save - Saving Done",_player);

// Mark last saved time
_player setVariable [QGVAR(lastSavedTime), CBA_missionTime];
