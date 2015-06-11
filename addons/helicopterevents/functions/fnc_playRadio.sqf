/*
 * Author: DaC, Jonpas
 * Attaches a radio to a helicopter and starts playing the selected track on it.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Music Track <STRING>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_heli,_track);

private ["_radio"];

// Create and Attach the radio object to the helicopter
_radio = "Sign_Sphere10cm_F" createVehicle position _heli; // Non-collidable
_radio attachTo [_heli, [0, 0, 0]];

// Make the radio object invisible (MP and SP support)
if (isMultiplayer) then {
    ["TAC_hideRadio", [_radio]] call ACE_FUNC(common,serverEvent); // hideObjectGlobal must be executed on server
} else {
    hideObject _radio;
};

// Set Variable for menu conditions
_heli setVariable [QGVAR(playingRadio), _radio, true];

// Star playing music on radio object
[_radio,_track] call cba_fnc_globalSay3d;
