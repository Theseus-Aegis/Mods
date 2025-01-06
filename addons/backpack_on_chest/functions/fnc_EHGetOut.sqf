#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Triggered by GetOutMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 * 3: turret path <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call tac_backpack_on_chest_fnc_EHGetOut;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" || isNil "_veh") exitWith {
    ERROR("No proper argument(s) given.");
};

private _chestpack = [_unit] call FUNC(chestpackContainer);
private _chestpackClass = [_unit] call FUNC(chestpack);

if !(_chestpackClass in GVAR(exceptions)) then {
    _chestpack attachTo [_unit, [0,-0.03,-0.5], "pelvis"];
    _chestpack setVectorDirAndUp [[-0.25,-1,0], [0,0,1]];
    _chestpack hideObjectGlobal false;
};

if (GVAR(walk)) then {
    [_unit, "forceWalk", "BackpackOnChest", true] call ACEFUNC(common,statusEffect_set);
};
