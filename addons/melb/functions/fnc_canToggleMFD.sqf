#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if MFD can be toggled (player in pilot or copilot seat).
 *
 * Arguments:
 * Vehicle <OBJECT>
 *
 * Return Value:
 * Can Toggle MFD <BOOL>
 *
 * Example:
 * _canToggleMFD = [_vehicle] call tac_compat_melb_fnc_canToggleMFD
 * condition = this call tac_compat_melb_fnc_canToggleMFD // UserActions
 *
 * Public: No
 */

params ["_vehicle"];

ACE_player == driver _vehicle ||
ACE_player == gunner _vehicle
