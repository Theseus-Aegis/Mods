#include "script_component.hpp"
/*
 * Author: veteran29
 * Randomize gear of the unit from available items.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]]
];

private _currentLoadout = getUnitLoadout _unit;
_currentLoadout set [7, ""]; // ignore facewear

if (!local _unit || {!(EMPTY_LOADOUT isEqualTo _currentLoadout) || {is3DEN}}) exitWith {
    LOG_1("Unit modified no randomization - %1",_unit); // HEMTT v0.10 bug: https://github.com/BrettMayson/HEMTT/issues/457
};

private _simEnabled = simulationEnabled _unit;

// Reinforcements compatibility - enable simulation temporarily
if (!_simEnabled) then {
    _unit enableSimulation true;
};

LOG_1("Randomizing gear - %1",_unit);

// check if there is a chance for the unit to have headgear and facewear
if (random 1 <= GVAR(Chance_Headgear)) then {
    _unit addHeadgear selectRandom RANDOM_GEAR(headgear);
};

if (random 1 <= GVAR(Chance_Facewear)) then {
    removeGoggles _unit;
    _unit addGoggles selectRandom RANDOM_GEAR(facewear);
};

_unit forceAddUniform selectRandom RANDOM_GEAR(uniforms);
_unit addVest selectRandom RANDOM_GEAR(vests);

// add basic gear to the uniform
{
    _unit addItemToUniform _x;
} forEach ["FirstAidKit", "HandGrenade", "SmokeShell"];

// add primary weapon
private _weapon = selectRandom RANDOM_GEAR(weapons);
_unit addWeapon _weapon;
[_unit, _weapon, 8, 4] call FUNC(addWeaponAmmo);

// add pistol
if (random 1 <= GVAR(Chance_Pistol)) then {
    private _pistol = selectRandom RANDOM_GEAR(pistols);
    _unit addWeapon _pistol;
    [_unit, _pistol, 3, 1] call FUNC(addWeaponAmmo);
};

// add launcher
if (random 1 <= GVAR(Chance_Launcher)) then {
    private _launcher = selectRandom RANDOM_GEAR(launchers);
    _unit addWeapon _launcher;

    if (!IS_DISPOSABLE(_launcher)) then {
        private _backpack = selectRandom RANDOM_GEAR(backpacks);
        _unit addBackpack _backpack;

        [_unit, _launcher, 3, 1] call FUNC(addWeaponAmmo);
    };
};

// Reinforcements compatibility - disable simulation again
if (!_simEnabled) then {
    _unit enableSimulation false;
};

nil
