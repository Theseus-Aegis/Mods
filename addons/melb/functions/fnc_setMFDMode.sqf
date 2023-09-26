#include "..\script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Set MFD Vision Mode (0 = Normal, 1 = Night, 2 = Thermal).
 *
 * Arguments:
 * 0: Vision Mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call tac_compat_melb_fnc_setMFDMode
 *
 * Public: No
 */

params ["_mode"];
_mode params ["_visionMode", "_flirIndex"];

switch (_visionMode) do {
    case 0: { // Normal (using Color Correction effect)
        "rendertarget0" setPiPEffect [3, 1, 1, 0.8, -0.05, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
    };
    case 1: { // Night Vision (using Color Correction effect)
        "rendertarget0" setPiPEffect [3, 1, 1, 3.5, 0, [0, 0, 0, 0], [0.5, 1, 0.5, 0], [1, 1, 1, 0]];
    };
    case 2: { // Thermal Imaging
        switch (_flirIndex) do {
            case 0: { // WHOT (using default Thermal Imaging)
                "rendertarget0" setPiPEffect [2];
            };
            case 1: { // BHOT (using Alt. Thermal Imaging 1 - Inverted)
                "rendertarget0" setPiPEffect [7];
            };
            default {
                ERROR_1("Unknown FLIR index (%1)!",_flirIndex);
            };
        };
    };
    default {
        ERROR_1("Unknown vision mode (%1)!",_visionMode);
    };
};
