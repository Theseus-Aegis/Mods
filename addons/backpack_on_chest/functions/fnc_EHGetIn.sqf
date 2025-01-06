#include "..\script_component.hpp"
/*
 * Author: DerZade, mjc4wilton
 * Triggered by GetInMan-Eventhandler
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
 * _this call tac_backpack_on_chest_fnc_EHGetIn;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" || isNil "_veh") exitWith {
    ERROR("No proper argument(s) given.");
};

private _chestpack = [_unit] call FUNC(chestpackContainer);

if (_veh isKindOf "ParachuteBase") then {
    _chestpack attachTo [_veh, [0, -0.03, -0.5]];
    _chestpack setVectorDirAndUp [[-0.25, -1, 0], [0, 0, 1]];
    _chestpack hideObjectGlobal false;
} else {
    detach _chestpack;
    hideObjectGlobal _chestpack;
    _chestpack setPos [-10000, -10000, -100];
};
