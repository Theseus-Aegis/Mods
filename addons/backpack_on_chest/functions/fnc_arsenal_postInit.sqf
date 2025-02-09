#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Called by postInit. Adds local "arsenalOpened" scriptedEventhandler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call tac_backpack_on_chest_fnc_arsenalPostInit;
 *
 * Public: No
 */

if !(hasInterface) exitWith {};

[missionNamespace, "arsenalOpened", FUNC(arsenal_opened)] call BIS_fnc_addScriptedEventHandler;
