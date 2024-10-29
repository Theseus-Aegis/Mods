#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles noises while unconscious
 *
 * Called locally per player via target event
 *
 * Arguments
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_medical_fnc_unconsciousFX
*/

[{
    params ["_args", "_handle"];
    _args params [["_firstIteration", true]];

    // If woken up or died end PFH.
    if !(ace_player getVariable ["ACE_isUnconscious", false]) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // Don't want the groaning to happen instantly.
    if (_firstIteration) exitWith {
        _args set [0, false];
    };

    // 50% chance of making noises, requires a heart rate above CPR/Cardiac Arrest
    private _heartRate = ace_player getVariable ["ace_medical_heartRate", 80];
    if (random 1 > GVAR(unconsciousFXChance) && _heartRate > 40) then {
        private _moan = selectRandom UNCONSCIOUS_NOISES;
        [QEGVAR(mission,say3D), [ace_player, _moan]] call CBA_fnc_globalEvent;
    };
}, GVAR(unconsciousFXTimer)] call CBA_fnc_addPerFrameHandler;
