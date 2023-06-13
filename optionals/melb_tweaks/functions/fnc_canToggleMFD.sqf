#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if MFD can be toggled (plaer in pilot or copilot seat).
 *
 * Arguments:
 * Vehicle <OBJECT>
 *
 * Return Value:
 * Can Toggle MFD <BOOL>
 *
 * Example:
 * _canToggleMFD = [_vehicle] call tac_melb_tweaks_fnc_canToggleMFD
 * condition = this call tac_melb_tweaks_fnc_canToggleMFD // UserActions
 *
 * Public: No
 */

params ["_vehicle"];

private _player = call CBA_fnc_currentUnit;

_player == driver _vehicle ||
_player == gunner _vehicle
