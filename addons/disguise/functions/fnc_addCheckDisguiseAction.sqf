/*
 * Author: Corello
 * Adds the "Check Disguise" action to the player upon loading.
 * Call from initPlayerLocal.sqf and onPlayerRespawn.sqf
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(addCheckDisguiseAction);
 */
#include "script_component.hpp"

params ["_playerObject"];

private _addDisguisedAction = [QGVAR(interactionDisguiseAction), localize LSTRING(CheckDisguise), "\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",{
    [_player] call FUNC(checkDisguise);
},{true}] call ACEFUNC(interact_menu,createAction);

["CAManBase", 1, ["ACE_SelfActions"], _addDisguisedAction, true] call ACEFUNC(interact_menu,addActionToClass);

["toggle-disguise", {
    if (GVAR(disguiseBlown)) then {
        [QGVAR(blowDisguise), true] call CBA_fnc_globalEvent;
        ["ace_common_systemChatGlobal", "[TAC] Disguise Blown"] call CBA_fnc_globalEvent;
    } else {
        [QGVAR(blowDisguise), false] call CBA_fnc_globalEvent;
        ["ace_common_systemChatGlobal", "[TAC] Disguise Intact"] call CBA_fnc_globalEvent;
    };
}, "admin"] call CBA_fnc_registerChatCommand;