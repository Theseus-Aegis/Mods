#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Whether the player can resume the flight of the frozen aircraft they're in: from the pilot's
 * seat, or a co-pilot's seat while the pilot's is empty.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can resume <BOOL>
 *
 * Example:
 * call tac_failsafe_fnc_canResume
 *
 * Public: No
 */

private _vehicle = objectParent ACE_player;

!isNull _vehicle
&& {!isNil {_vehicle getVariable QGVAR(frozen)}}
&& {driver _vehicle == ACE_player || {isNull driver _vehicle && {[_vehicle, ACE_player] call FUNC(isCopilot)}}}
