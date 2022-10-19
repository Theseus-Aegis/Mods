#include "..\script_component.hpp"
/*
 * Author: Alganthe, Mike
 * Specified masks protect from a contamination zone while providing HUD/Sound effects.
 * Requires a marker covering an area named "Contamination" for damage to take effect.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player] call MFUNC(respiratorEffects);
 */

params ["_player"];

GVAR(maskCounter) =  CBA_missionTime;
GVAR(lastSoundRan) = CBA_missionTime;
GVAR(oldGlasses) = "";

// Lower-case!
#define MASKS ["g_airpurifyingrespirator_01_f", "g_airpurifyingrespirator_02_black_f", "g_airpurifyingrespirator_02_olive_f", "g_airpurifyingrespirator_02_sand_f", "g_regulatormask_f"]

[{
    private _goggles = toLower (goggles ACE_player);

    if (_goggles in MASKS) then {
        // Breathing effect, adjust to fit sound length.
        if (GVAR(lastSoundRan) + 3 < CBA_missionTime) then {
            GVAR(lastSoundRan) = CBA_missionTime;
            playSound "tacr_gasmask_breath";
        };
        // Add Mask
        if (GVAR(oldGlasses) != _goggles) then {
            playSound "tacr_gasmask_on";
            "tacr_gasmask_overlay" cutRsc ["tacr_gasmask", "PLAIN", 1, false];
        };
    } else {
        // Mask Removal
        if (GVAR(oldGlasses) in MASKS) then {
            playSound "tacr_gasmask_off";
            "tacr_gasmask_overlay" cutFadeOut 0;
        };
        // Damage
        if (ACE_player inArea "Contamination" && {GVAR(maskCounter) + 10 < CBA_missionTime}) then {
            GVAR(maskCounter) = CBA_missionTime;
            // Adjust damage / remove body parts to fit your needs.
            private _bodypart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
            [ACE_player, 0.15, _bodyPart, "stab"] call ACEFUNC(medical,addDamageToUnit);
        };
    };

    GVAR(oldGlasses) = _goggles;
} , 1, []] call CBA_fnc_addPerFrameHandler;
