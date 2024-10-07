#include "..\script_component.hpp"
/*
 * Author: Mike
 * Improves the ace tripflare effect by having it fire a flare into the sky instead of on the ground.
 * Called from ace_tripflareTriggered event
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call MFUNC(tripflare)
 */

params ["_object", "_posXYZ"];

if !(GVAR(improvedFlaresEnabled)) exitWith {};

private _originalFlare = _object nearObjects ["FlareBase", 5];

if (_originalFlare isNotEqualTo []) then {
    [{
        params ["_originalFlare"];
        deleteVehicle (_originalFlare select 0);
    }, [_originalFlare], 1] call CBA_fnc_waitAndExecute;
};

private _flareClass = ["CUP_F_40mm_Star_White", "CUP_F_40mm_Star_Red", "CUP_F_40mm_Star_Green"] select GVAR(improvedFlaresColour);
private _flare = createVehicle [_flareClass, [_posXYZ#0, _posXYZ#1, 200], [], 0, "CAN_COLLIDE"];
_flare setVelocity [0, 0, -10];
