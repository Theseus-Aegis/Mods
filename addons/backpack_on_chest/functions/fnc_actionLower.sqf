#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Triggered by the lower-action. Attaches chestpack to a dummy and connects dummy to parachute by rope.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call tac_backpack_on_chest_fnc_actionLower;
 *
 * Public: No
 */

params ["_unit"];

private _chute = vehicle _unit;

// Rope top helper, workaround parachute rope visual bug, allow cut
private _ropeTop = createVehicle ["ace_fastroping_helper", getPos _chute, [], 0, "CAN_COLLIDE"];
_chute setVariable [QGVAR(loweringLine), _ropeTop, true];
_ropeTop allowDamage false;
_ropeTop disableCollisionWith _chute;

// Weapon holder with backpack
private _holder = [_unit] call FUNC(chestpackToHolder); // Chestpack to holder
_holder disableCollisionWith _chute;
_holder setPos (_chute modelToWorld [0, 1, -1]);
_holder setVelocity velocity _chute;

private _rope = ropeCreate [
    _ropeTop, [0,0,0],
    _holder, [0.1,-0.2,-0.55],
    5
];

[{
    params ["_chute", "_ropeTop"];
    _ropeTop attachTo [_chute, [0,0,0]];
}, [_chute, _ropeTop]] call CBA_fnc_execNextFrame;

[QGVAR(checkLandedPFH), [_ropeTop, _holder]] call CBA_fnc_serverEvent;
