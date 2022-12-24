#include "script_component.hpp"
/*
 * Author: Rory, Jonpas, Mike
 * Teleports the player from base (this) to teleport locations (objects).
 * Condition to show teleport action can be set.
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 * 1: Teleport target object <OBJECT>
 * 2: Teleport target display name <STRING>
 * 3: Condition <CODE> (default: {true})
 *
 * Return Value:
 * None
 *
 * Example:
 * [tpObj, tpPos, "Teleport"] call MFUNC(teleport);
 * [tpObj, tpPos, "Teleport", {TAC_Example}] call MFUNC(teleport);
 */

params ["_controller", "_teleportObject", "_text", ["_condition", {true}]];

private _action = [
    format ["TAC_Scripts_teleport_%1", _teleportObject],
    _text,
    "",
    {
        (_this select 2) params ["_teleportObject", "_text"];
        titleText [format ["%1", _text], "BLACK IN", 2];
        ACE_player setPosASL (getPosASL _teleportObject);
        titleFadeOut 2;
    },
    _condition,
    {},
    [_teleportObject, _text]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
