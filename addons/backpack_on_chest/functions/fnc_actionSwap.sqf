#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Triggered by the swap-action. Handles all the stuff.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_actionSwap;
 *
 * Public: No
 */
params ["_unit"];

private _backpack = backpack _unit;
private _backpackLoad = loadBackpack _unit;
private _backpackLoadout = ((getUnitLoadout _unit) select 5) select 1;
private _backpackVariables = [];

private _chestpack = [_unit] call FUNC(chestpack);
private _chestpackLoadout = [_unit] call FUNC(chestpackLoadout);
private _chestpackVariables = [_unit] call FUNC(chestpackVariables);

// make sure the player has chest-pack and backpack
if ((_backpack isEqualTo "") || ([_unit] call FUNC(chestpack)) isEqualTo "") exitWith {};

// Backpack Variable Handling
{
    private _val = (backpackContainer _unit) getVariable _x;
    _backpackVariables pushBack [_x, _val];
} forEach ((allVariables (backpackContainer _unit) - GVAR(VarBlacklist)));

// remove packs
[_unit] call FUNC(removeChestpack);
removeBackpackGlobal _unit;

// add backpack loadout
private _loadout = getUnitLoadout _unit;
_loadout set [5, [_chestpack, _chestpackLoadout]];
_unit setUnitLoadout _loadout;

// add backpack variables
private _backpackNew = backpackContainer _unit;
{
     _backpackNew setVariable [(_x select 0), (_x select 1), true];
} forEach _chestpackVariables;

// add chestpack
[_unit, _backpack, _backpackLoadout, _backpackVariables, _backpackLoad] call FUNC(addChestpack);
