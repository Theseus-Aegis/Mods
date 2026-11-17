#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Checks if an object is at base: within the return distance of a Locker (tac_armory_Locker, or an object
 * set up as an Armory with tac_armory_fnc_init).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * At Base <BOOL>
 *
 * Example:
 * [cursorObject] call tac_bodybag_fnc_isAtBase
 *
 * Public: No
 */

params ["_object"];

(nearestObjects [_object, ["tac_armory_Locker"], GVAR(returnDistance)]) isNotEqualTo []
|| {(missionNamespace getVariable ["tac_armory_objects", []]) findIf {!isNull _x && {_x distance _object <= GVAR(returnDistance)}} != -1}
