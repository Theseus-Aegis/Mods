#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Triggered by AnimDone-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: animtaion <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call tac_backpack_on_chest_fnc_EHAnimDone;
 *
 * Public: No
 */
params ["_unit","_anim"];

if (isNil "_unit") exitWith {
    ERROR("No proper argument(s) given.");
};

private _chestpack = [_unit] call FUNC(chestpackContainer);
private _chestpackClass = [_unit] call FUNC(chestpack);

// freefall
if ((animationState _unit) find "halofreefall_" isEqualTo 0) then {
    if !(_chestpackClass in GVAR(exceptions)) then {
        _chestpack attachTo [_unit,[0,-0.4,0.05],"pelvis"];
        _chestpack setVectorDirAndUp [[0,0,1],[0,1,0]];
    };
};
