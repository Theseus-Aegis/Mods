#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles fire support calls by ammo type and calls the correct supporting fire, will also differentiate HE/Smoke.
 * Called via server event.
 *
 * Arguments:
 * 0: Position of fired projectile <ARRAY>
 * 1: Ammo <STRING>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(handleSupport);
 */

params ["_position", "_ammo", "_unit"];

// Alter position height to always be 0.
_position set [2, 0];

private _supportToFire = 0;
if (_ammo in GVAR(smokeSupportTypes)) then {
    _supportToFire = 1;
};

if (_ammo in GVAR(mortarSignalTypes)) exitWith {
    [_supportToFire, _position, _unit] call FUNC(mortarSupport);
};

if (_ammo in GVAR(artillerySignalTypes)) exitWith {
    [_supportToFire, _position, _unit] call FUNC(artillerySupport);
};

// Only one support type available.
if (_ammo == QGVAR(rocketAmmoHEGL)) exitWith {
    [_position, _unit] call FUNC(rocketSupport);
};
