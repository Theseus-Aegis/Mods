#include "script_component.hpp"
/*
 * Author: Jonpas
 * Returns applicable animations of a target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _anims = target call tac_shootingrange_fnc_getTargetAnimations;
 *
 * Public: No
 */

params ["_target"];

// Find oval target
private _index = OVAL_TARGETS find (toLower (typeOf _target));

if (_index != -1) then {
    // Oval target
    OVAL_TARGET_ANIMS select _index
} else {
    // Normal target
    ["Terc"]
};
