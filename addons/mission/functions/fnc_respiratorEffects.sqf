#include "script_component.hpp"
/*
 * Author: Alganthe, Mike
 * Specified masks protect from a contamination zone while providing HUD/Sound effects.
 * Requires a marker covering an area named for damage to take effect. Can be used for multiple marker zones.
 * Provides Burn damage on Head/Torso if inside a zone without a mask.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Markers <ARRAY>
 * 1: Damage Per Tick <NUMBER> (default: 0.15)
 * 2: Damage Tick Rate <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["MyMarker"]] call MFUNC(respiratorEffects)
 * [["MyMarker", "MyMarkerTwo"], 0.6, 5] call MFUNC(respiratorEffects)
 */

params ["_markers", ["_damagePerTick", 0.15], ["_damageTickRate", 10]];

GVAR(maskCounter) =  CBA_missionTime;
GVAR(lastSoundRan) = CBA_missionTime;
GVAR(oldGlasses) = "";

// Damage capped at 1, basically an instant knock out or kill.
if (_damagePerTick > 1) then {
    _damagePerTick = 1;
    WARNING_1("Damage Per Tick (%1) higher than 1, setting to maximum (1)!",_damagePerTick);
};

// If not player defined use default
if (isNil QGVAR(respiratorMasks)) then {
    // Lower-case!
    GVAR(respiratorMasks) = ["g_airpurifyingrespirator_01_f", "g_airpurifyingrespirator_02_black_f", "g_airpurifyingrespirator_02_olive_f", "g_airpurifyingrespirator_02_sand_f", "g_regulatormask_f"];
};

[{
    params ["_args", "_handle"];
    _args params ["_markers", "_damagePerTick", "_damageTickRate"];

    private _goggles = toLower (goggles ace_player);

    if (_goggles in GVAR(respiratorMasks)) then {
        // Breathing effect
        if (GVAR(lastSoundRan) + 3 < CBA_missionTime) then {
            GVAR(lastSoundRan) = CBA_missionTime;

            // Optional disabling of mask sounds via: ace_player setVariable ["TAC_Mission_enableMaskSounds", false];
            if (ace_player getVariable [QGVAR(enableMaskSounds), true] && {alive ace_player}) then {
                playSound "tacr_gasmask_breath";
            };
        };
        // Add Mask
        if (GVAR(oldGlasses) != _goggles) then {
            playSound "tacr_gasmask_on";
            "tacr_gasmask_overlay" cutRsc ["tacr_gasmask", "PLAIN", 1, false];
        };
    } else {
        // Mask Removal
        if (GVAR(oldGlasses) in GVAR(respiratorMasks)) then {
            playSound "tacr_gasmask_off";
            "tacr_gasmask_overlay" cutFadeOut 0;
        };

        // Damage
        if ((_markers findIf {ace_player inArea _x}) >= 0 && {GVAR(maskCounter) + _damageTickRate < CBA_missionTime}) then {
            GVAR(maskCounter) = CBA_missionTime;

            private _bodypart = selectRandom ["Head", "Body"];
            [ace_player, _damagePerTick, _bodyPart, "burn"] call ACEFUNC(medical,addDamageToUnit);
        };
    };

    // failsafe if player dies and mask overlay doesn't get removed.
    if (!alive ace_player) exitWith {
        "tacr_gasmask_overlay" cutFadeOut 0;
    };

    GVAR(oldGlasses) = _goggles;
} , 1, [_markers, _damagePerTick, _damageTickRate]] call CBA_fnc_addPerFrameHandler;
