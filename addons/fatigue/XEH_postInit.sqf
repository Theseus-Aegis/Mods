#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Crouch-Walking made harder
[QGVAR(kneel), {
    params ["_unit"];

    private _animName = animationState _unit;
    private _animType = _animName select [1, 3];
    private _animPos = _animName select [5, 3];

    // Increase anim duty if crouch-walking
    if (_animType in ["idl", "mov", "adj"] && _animPos == "knl") exitWith {
        2 // default crouch-walking is 1.5 -> 1.5 * 2 = 3 (final duty)
    };

    1 // Keep as is for everything else
}] call ACEFUNC(advanced_fatigue,addDutyFactor);
