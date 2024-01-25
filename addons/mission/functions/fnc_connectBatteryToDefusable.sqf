#include "..\script_component.hpp"
/*
 * Author: Jonpas, Mike
 * Requires a Battery to IED setup, handles disconnecting battery from IED and defusing it.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments
 * 0: Battery <OBJECT>
 * 1: Defusable Explosive <OBJECT>
 * 2: Condition <CODE> (default: {true})
 *
 * Return Value:
 * None
 *
 * Example:
 * [Battery, IED] call MFUNC(connectBatteryToDefusable)
 */

params ["_battery", "_explosive", ["_condition", {true}]];

private _action = [
    QGVAR(disconnectIEDAction),
    "Disconnect IED",
    "",
    {
        params ["_target", "_player", "_explosive"];
        [
            5,
            [_player, _explosive],
            {
                (_this select 0) call ACEFUNC(explosives,defuseExplosive);
            },
            {},
            "Disconnecting Battery...",
            {true},
            ["isNotSwimming"]
        ] call ACEFUNC(common,progressBar);
    },
    _condition,
    {},
    _explosive
] call ACEFUNC(interact_menu,createAction);

[_battery, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
