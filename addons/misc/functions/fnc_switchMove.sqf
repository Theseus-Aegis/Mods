/*
 * Author: Jonpas
 * Handles the animation switching.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [<arg0>, <arg1>] call TAC_Misc_fnc_switchMove;
 */
#include "script_component.hpp"

private ["_object", "_anim"];

_object = _this select 0;
_anim = _this select 1;

_object switchMove _anim;
