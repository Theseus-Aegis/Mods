#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Checks if a bodybag can be returned to its owner: it has one, it's at base, isn't being sent, and
 * Apollo saves players.
 *
 * Arguments:
 * 0: Bodybag <OBJECT>
 *
 * Return Value:
 * Can Return <BOOL>
 *
 * Example:
 * [cursorObject] call tac_bodybag_fnc_canReturnToOwner
 *
 * Public: No
 */

params ["_bodybag"];

(_bodybag getVariable [QGVAR(ownerUID), ""]) != ""
&& {!(_bodybag getVariable [QGVAR(busy), false])}
&& {missionNamespace getVariable ["tac_apollo_enabledPlayers", false]}
&& {[_bodybag] call FUNC(isAtBase)}
