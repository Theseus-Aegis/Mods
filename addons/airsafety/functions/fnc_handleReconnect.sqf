#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * A player is in after (re)connecting: if they left while flying an aircraft that is still
 * frozen with its pilot's seat empty, they're put back in it (with or without Chronos). They
 * resume the flight themselves (FUNC(resume)), once they're ready.
 * Runs on the server.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "76561198000000000"] call tac_airsafety_fnc_handleReconnect
 *
 * Public: No
 */

params ["_unit", "_uid"];

private _vehicle = GVAR(frozen) getOrDefault [_uid, objNull];
if (!alive _vehicle || {isNil {_vehicle getVariable QGVAR(frozen)}}) exitWith {
    GVAR(frozen) deleteAt _uid;
};

// A little later, after the player's own loading (Chronos puts them where they were, the same seat if it's free)
[{
    params ["_unit", "_vehicle"];
    if (alive _unit && {alive _vehicle} && {isNull driver _vehicle}) then {
        [QGVAR(reseat), [_vehicle], _unit] call CBA_fnc_targetEvent;
    };
}, [_unit, _vehicle], 5] call CBA_fnc_waitAndExecute;
