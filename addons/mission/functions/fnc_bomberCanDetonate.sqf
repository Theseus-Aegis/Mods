#include "..\script_component.hpp"
/*
 * Author: Mike, Jonpas
 * Checks if a bomber is ready to detonate
 *
 * Called from Bomber function
 *
 * Arguments:
 * 0: Suicide Bomber <OBJECT>
 * 1: Distance to Target <NUMBER>
 * 2: Detonate Radius <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bomber] call MFUNC(bomberCanDetonate)
 */

params ["_unit", "_distanceToTarget", "_detonateRadius"];

// If unit dead, blow anyway.
if (!alive _unit) exitWith {true};

// If unit is uncon, kill it and blow.
if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {
    _unit setDamage 1;
    true
};

// If unit has reached detonation radius, blow it.
if (_distanceToTarget <= _detonateRadius) exitWith {
    doStop _unit;
    true
};

false
