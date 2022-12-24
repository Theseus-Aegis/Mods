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
 * [player] call MFUNC(godMode);
 */

params ["_player"];

if ((getPlayerUID _player) in GVAR(admins)) then {
    [true, true] call acre_api_fnc_godModeConfigureAccess;
    [GVAR(admins), 0] call acre_api_fnc_godModeModifyGroup;
    ["Admins", 0] call acre_api_fnc_godModeNameGroup;
};
