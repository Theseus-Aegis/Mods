#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles loadout change and periodic saves. Requests a save of the player after a delay.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Periodic Save <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [], false] call tac_apollo_fnc_playerSaveClient
 *
 * Public: No
 */

params ["_player", ["_periodic", false]];
TRACE_2("Player Save Client",_player,_periodic);

// Call next periodic save
if (_periodic) then {
    [FUNC(playerSaveClient), [_player, _periodic], SAVE_DELAY_PERIODIC] call CBA_fnc_waitAndExecute;
};

// Exit if saving has not started yet or delay has not passed yet
private _lastSavedTime = _player getVariable [QGVAR(lastSavedTime), -1];
private _delay = [SAVE_DELAY_INV_CHANGE, SAVE_DELAY_PERIODIC] select _periodic;
if (_lastSavedTime == -1 || {_lastSavedTime + _delay >= CBA_missionTime}) exitWith {
    TRACE_1("Save - Not Saving (Delay Running)",CBA_missionTime);
};

// Exit if remote controlling a unit or the player is still invisible
if (_player != player || {isNull _player} || {!alive _player}) exitWith {
    TRACE_1("Save - Not Saving",CBA_missionTime);
};

[QGVAR(savePlayer), [_player, profileName, "save"]] call CBA_fnc_serverEvent;
TRACE_1("Save - Saving Done",_player);

// Mark last saved time
_player setVariable [QGVAR(lastSavedTime), CBA_missionTime, true];
