#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Moves the player from their seat to the empty pilot's seat of the frozen aircraft they're in
 * (its own seat switching may not work while frozen).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_airsafety_fnc_takePilotSeat
 *
 * Public: No
 */

private _vehicle = objectParent ACE_player;
if (isNull _vehicle || {!isNull driver _vehicle}) exitWith {};

moveOut ACE_player;
ACE_player moveInDriver _vehicle;
