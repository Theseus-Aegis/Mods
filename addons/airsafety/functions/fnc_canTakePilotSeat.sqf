#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Whether the player can move to the empty pilot's seat of the frozen aircraft they're in.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can take the seat <BOOL>
 *
 * Example:
 * call tac_airsafety_fnc_canTakePilotSeat
 *
 * Public: No
 */

private _vehicle = objectParent ACE_player;

!isNull _vehicle
&& {!isNil {_vehicle getVariable QGVAR(frozen)}}
&& {isNull driver _vehicle}
&& {!lockedDriver _vehicle}
