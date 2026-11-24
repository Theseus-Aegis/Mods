#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Whether the unit sits in a co-pilot seat of the vehicle (a turret with isCopilot).
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Co-pilot <BOOL>
 *
 * Example:
 * [vehicle player, player] call tac_failsafe_fnc_isCopilot
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

private _turret = _vehicle unitTurret _unit;
_turret isNotEqualTo [] && {getNumber ([_vehicle, _turret] call CBA_fnc_getTurret >> "isCopilot") == 1}
