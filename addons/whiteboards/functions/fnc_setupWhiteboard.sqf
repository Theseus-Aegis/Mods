/*
 * Author: Jonpas
 * Initializes the Whiteboards module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if !(isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

private ["_whiteboards", "_controllers", "_images", "_names", "_controller"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (isNull _logic) exitWith {};

_whiteboards = [_logic getVariable ["Whiteboard", ""], true, true] call FUNC(makeList);
_controllers = [_logic getVariable ["Controller", ""], true, true] call FUNC(makeList);

// Objects synced to the module
{
    if (typeOf _x in ["Land_MapBoard_F", "Land_Laptop_unfolded_F", "Land_Laptop_device_F", "Land_PCSet_01_screen_F"]) then {
        _whiteboards pushBack _x;
    };

    if (typeOf _x in ["Land_Laptop_unfolded_F", "Land_Laptop_device_F", "Land_HandyCam_F", "Land_MobilePhone_smart_F", "Land_Tablet_01_F", "Land_PCSet_01_keyboard_F", "Land_PCSet_01_mouse_F", "Land_GamingSet_01_controller_F"]) then { 
        _controllers pushBack _x;
    };
} forEach (synchronizedObjects _logic);

// If no controllers use whiteboards as controllers
if (count _controllers == 0) then {
    _controllers = _whiteboards;
};

// Images and action names
_images = [_logic getVariable ["Images", ""], true, false] call FUNC(makeList);
_names = [_logic getVariable ["Names", ""], true, false] call FUNC(makeList);

TRACE_4("Information",_whiteboards,_controllers,_images,_names);

// Default images on whiteboards (first image)
{
    _x setObjectTextureGlobal [0, _images select 0];
} forEach _whiteboards;

// Set first image as default and set variable on controllers with necessary information
{
    _x setVariable [QGVAR(Slides), [_whiteboards, _images, _names], true];
    TRACE_1("Assigning Slides to",_x);
} forEach _controllers;

diag_log text format ["[TAC]: Whiteboards Module Initialized for: %1", _whiteboards];
