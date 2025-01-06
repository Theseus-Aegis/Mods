#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Triggered by the onChest-action. Handles all the stuff.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_actionOnChest;
 *
 * Public: No
 */

params["_unit"];

private _backpack = backpack _unit;
private _backpackLoad = loadBackpack _unit;
private _backpackLoadout = ((getUnitLoadout _unit) select 5) select 1;
private _backpackVariables = [];

{
    private _val = (backpackContainer _unit) getVariable _x;
    _backpackVariables pushBack [_x, _val];
} forEach ((allVariables (backpackContainer _unit) - GVAR(VarBlacklist)));

[_unit, _backpack, _backpackLoadout, _backpackVariables, _backpackLoad] call FUNC(addChestpack);

removeBackpackGlobal _unit;
