#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up ACRE2 God Mode access and groups for Admins.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call MFUNC(godMode)
 */

params ["_player"];

if ((getPlayerUID _player) in GVAR(admins)) then {
    // Allow BI Chat Channels and Group presets
    [true, true] call acre_api_fnc_godModeConfigureAccess;

    // Admins group
    [GVAR(admins), 0] call acre_api_fnc_godModeModifyGroup;
    ["Admins", 0] call acre_api_fnc_godModeNameGroup;

    // Spectators group
    [ACEFUNC(spectator,players), 1] call acre_api_fnc_godModeModifyGroup;
    ["Spectators", 1] call acre_api_fnc_godModeNameGroup;
};
