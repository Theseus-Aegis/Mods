#include "script_component.hpp"
/*
 * Author: Mike
 * Functionality for toggling switches, when switch is "OFF" the light is red and power levels are 0, when switch is "ON" the light is green and power levels are 1 or player defined.
 *
 * Default state is 0 or 1
 *
 * Switch state can be checked by getVariable
 * My_Switch getVariable ["TAC_switchState", false];
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Switch <OBJECT>
 * 1: Default State <NUMBER> (default: 0 (OFF))
 * 2: Voltages when on <ARRAY> (default: [1, 1])
 * 3: Condition <CODE> (default: {true})
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Switch, 0, [0.3, 0.4]] call MFUNC(switchAction);
 * [My_Switch, 1, [0.7, 0.2], {TAC_Example}] call MFUNC(switchAction);
 */

params ["_object", ["_state", 0], ["_voltages", [1, 1]], ["_condition", {true}]];

// Initial switch setup
if (isServer) then {
    if (_state == 1) then {
        _object animateSource ["SwitchLight", 1, 1];
        _object animateSource ["SwitchPosition", 1, true];
        _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,1,0,0.05,ca)"];
        _object animateSource ["Power_1", (_voltages select 0), true];
        _object animateSource ["Power_2", (_voltages select 1), true];
        _object setVariable ["TAC_switchState", true, true];
    } else {
        _object animateSource ["SwitchLight", 1, 1];
        _object animateSource ["SwitchPosition", -1, true];
        _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,0,0,0.05,ca)"];
        _object animateSource ["Power_1", 0, true];
        _object animateSource ["Power_2", 0, true];
        _object setVariable ["TAC_switchState", false, true];
    };
};

if (hasInterface) then {
    private _switchAction = [
        QGVAR(switchAction),
        "Pull Switch",
        "",
        {
            (_this select 2) params ["_object", "_state", "_voltages"];
            private _handleState = _object animationSourcePhase "SwitchPosition";
            if (_handleState == 1) then {
                _object animateSource ["SwitchPosition", -1, 0.5];
                _object animateSource ["Power_1", 0, 0.25];
                _object animateSource ["Power_2", 0, 0.25];
                _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,0,0,0.05,ca)"];
                _object setVariable ["TAC_switchState", false, true];
            } else {
                _object animateSource ["SwitchPosition", 1, 0.5];
                _object animateSource ["Power_1", (_voltages select 0), 0.25];
                _object animateSource ["Power_2", (_voltages select 1), 0.25];
                _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,1,0,0.05,ca)"];
                _object setVariable ["TAC_switchState", true, true];
            };
        },
        _condition,
        {},
        [_object, _state, _voltages],
        "controlling_handle"
    ] call ACEFUNC(interact_menu,createAction);

    [_object, 0, [], _switchAction] call ACEFUNC(interact_menu,addActionToObject);
};
