/*
 * Author: Jonpas
 * Handles hit part event handler.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Up (true) / Down (false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, true] call tac_shootingrange_fnc_triggerPopup;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_up"];

if (_up) then {
    _target animate ["terc", 0]; // Up
} else {
    _target animate ["terc", 1]; // Down
};
