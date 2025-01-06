#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Removes unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_removeChestpack;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable [QGVAR(chestpack), nil];

// delete chestpackContainer
deleteVehicle ([_unit] call FUNC(chestpackContainer));

// remove all EHs
_unit removeEventHandler ["GetInMan",(_var select 1) select 0];
_unit removeEventHandler ["GetOutMan",(_var select 1) select 1];
_unit removeEventHandler ["AnimDone",(_var select 1) select 2];
_unit removeEventHandler ["Killed",(_var select 1) select 3];

if (GVAR(walk)) then {
    [_unit, "forceWalk", "BackpackOnChest", false] call ACEFUNC(common,statusEffect_set);
};

// reset variable
_unit setVariable [QGVAR(chestpack), nil, true];
