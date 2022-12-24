#include "script_component.hpp"
/*
 * Author: Mike
 * Functionality for toggling switches, When "OFF" switch is red and power levels are 0, when "ON" switch is Green and power levels are either 1 or player defined.
 *
 * Default state is 0 (OFF) or 1 (ON)
 *
 * Can be checked by using getVariable on the object for switch state.
 * My_Switch getVariable ["TAC_Switched", false];
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Switch <OBJECT>
 * 1: Left Voltage On <NUMBER> (default: 1)
 * 2: Right Voltage On <NUMBER> (default: 1)
 * 3: Default state <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Switch] call MFUNC(switchAction)
 * [My_Switch, 0.5, 0.7] call MFUNC(switchAction)
 * [My_Switch, 0.5, 0.7, 1] call MFUNC(switchAction)
 */

params ["_object", ["_powerOne", 1], ["_powerTwo", 1], ["_defaultState", 0]];

if (hasInterface) then {
    private _switchAction = [
        QGVAR(switchAction),
        "Flick Switch",
        "",
        {
            (_this select 2) params ["_object"];
            private _sourcePhase = _object animationSourcePhase "SwitchPosition";
            if (_sourcePhase == -1) then {
                _object animateSource ["SwitchPosition", 1, 0.5];
            } else {
                _object animateSource ["SwitchPosition", -1, 0.5];
            };
        },
        {true},
        {},
        _object,
        "controlling_handle"
    ] call ACEFUNC(interact_menu,createAction);

    [_object, 0, [], _switchAction] call ACEFUNC(interact_menu,addActionToObject);
};

if (isServer) then {
    // Turn light on.
    _object animateSource ["SwitchLight", 1, 1];

    // Default switch state, OFF or ON
    private _switchState = [-1, 1] select _defaultState; // translate default state to switch state (0 = -1, 1 = 1)
    _object animateSource ["SwitchPosition", _switchState, 0.5];

    [{
        params ["_args", "_handle"];
        _args params ["_object", "_powerOne", "_powerTwo", ["_switchLastState", -1]];

        // Check all animation sources on objects to see if switched or not. (1: ON / -1: OFF)
        private _switch = _object animationSourcePhase "SwitchPosition";

        // Update last state
        _args set [3, _switch];

        if (_switch != _switchLastState) then {
            if (_switch == 1) exitWith {
                _object animateSource ["Power_1", _powerOne, 0.25];
                _object animateSource ["Power_2", _powerTwo, 0.25];
                _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,1,0,0.05,ca)"];
                _object setVariable ["TAC_Switched", true, true];
            };
            if (_switch == -1) exitWith {
                _object animateSource ["Power_1", 0, 0.25];
                _object animateSource ["Power_2", 0, 0.25];
                _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,0,0,0.05,ca)"];
                _object setVariable ["TAC_Switched", false, true];
            };
        };
    }, 1, [_object, _powerOne, _powerTwo]] call CBA_fnc_addPerFrameHandler;
};
