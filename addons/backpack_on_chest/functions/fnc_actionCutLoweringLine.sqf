#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Triggered by the CutLoweringLine-action. Detaches the lowering line top
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_actionCutLoweringLine;
 *
 * Public: No
 */

params ["_unit"];
private _chute = vehicle _unit;
private _ropeTop = _chute getVariable [QGVAR(loweringLine), objNull];
if (!isNull _ropeTop) then {
    private _rope = (ropes _ropeTop) select 0;
    private _holder = (ropeAttachedObjects _ropeTop) select 0;
    if !(isNull _holder) then {
        _holder ropeDetach _rope;
        ropeDestroy _rope;
    };
    _chute setVariable [QGVAR(loweringLine), nil, true];
};
