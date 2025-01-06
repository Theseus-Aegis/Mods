#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Adds a chestpack to a unit. If a unit already has one, the old chestpack will be ignored and will be deleted completely.
 *
 * Arguments:
 * 0: Unit  <OBJECT>
 * 1: Backpack Classname <STRING>
 * 2: Backpack Loadout <ARRAY>
 * 3: Backpack Variables <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "B_Kitbag_rgr", ["FirstAidKit", 5], ["ace_gunbag_gunbagWeapon", "srifle_GM6_F"], []] call tac_backpack_on_chest_fnc_addChestpack;
 *
 * Public: No
 */
params ["_unit", "_chestpackClass", ["_backpackLoadout", []], ["_backpackVariables", []], ["_backpackLoad", -2]];

if (_backpackLoad isEqualTo -2) then {
    _backpackLoad = loadBackpack _unit;
};

// add HandleDisconnect-EH on server if not done yet
if !(GETMVAR(GVAR(HDCEHadded),false)) then {
    [QGVAR(handleDisconnect), []] call CBA_fnc_serverEvent;
    GVAR(HDCEHadded) = true;
    publicVariable QGVAR(HDCEHadded);
};

// delete existing chestpack, if there is one
if ([_unit] call FUNC(chestpack) != "") then {
    [_unit] call FUNC(removeChestpack);
};

// add EHs
private _getInID = _unit addEventHandler ["GetInMan",FUNC(EHGetIn)];
private _getOutID = _unit addEventHandler ["GetOutMan",FUNC(EHGetOut)];
private _animID = _unit addEventHandler ["AnimDone",FUNC(EHAnimDone)];
private _killedID = _unit addEventHandler ["Killed",FUNC(EHKilled)];

// create chestpack itself
private _chestpack = createSimpleObject [_chestpackClass, getPos _unit];

if (GVAR(walk)) then {
    [_unit, "forceWalk", "BackpackOnChest", true] call ACEFUNC(common,statusEffect_set);
};

// set variable
_unit setVariable [QGVAR(chestpack), [[_chestpackClass, _chestpack], [_getInID, _getOutID, _animID, _killedID], _backpackLoadout, _backpackVariables, _backpackLoad], true];

// handle vehicles
if (vehicle _unit isNotEqualTo _unit) then {
    [_unit, "", vehicle _unit] call FUNC(EHGetIn);
} else {
    [_unit, "", objNull] call FUNC(EHGetOut);
};
