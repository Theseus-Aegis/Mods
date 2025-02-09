#include "..\script_component.hpp"
/*
 * Author: Mike
 * Destroys the vehicle (without effects) and adds a fire effect to it. Optionally allows deletion after a set time, if time isn't set it is not deleted.
 * Effect types are 0 - Fire, 1 - Smoke and 2 - Bubbles (Only in water).
 * Call from initServer.sqf.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Destroy Vehicle <BOOL> (default: true)
 * 2: Effect Type <NUMBER> (default: 0)
 * 3: Time until deletion <NUMBER> (default: 0)
 * 4: Attachment Offset <POSITION> (default: [0, 0, 0])
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyVehicle] call MFUNC(ambientEffects);
 */

params ["_vehicle", ["_destroyVehicle", true], ["_effectType", 0], ["_timeUntilDelete", 0], ["_attachOffset", [0, 0, 0]]];

if (!isServer || isNull _vehicle) exitWith {};

if (_destroyVehicle) then {
    _vehicle setDamage [1, false];
};

private _effectType = ["test_EmptyObjectForFireBig", "test_EmptyObjectForSmoke", "test_EmptyObjectForBubbles"] select _effectType;

private _effect = createVehicle [_effectType, getPosATL _vehicle, [], 0, "CAN_COLLIDE"];
_effect attachTo [_vehicle, _attachOffset];

if (_timeUntilDelete > 0) then {
    [{
        params ["_effect"];
        deleteVehicle _effect;
    }, [_effect], _timeUntilDelete] call CBA_fnc_waitAndExecute;
};
