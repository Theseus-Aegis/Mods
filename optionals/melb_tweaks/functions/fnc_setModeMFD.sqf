#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Set MFD Mode (0 = Normal, 1 = Night, 2 = Thermal).
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call tac_melb_tweaks_fnc_setModeMFD
 *
 * Public: No
 */

params ["_mode"];

switch (_mode) do {
    case 0: {
        "rendertarget0" setPiPEffect [3, 1, 1, 0.8, -0.05, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
    };
    case 1: {
        "rendertarget0" setPiPEffect [3, 1, 1, 3.5, 0, [0, 0, 0, 0], [0.5, 1, 0.5, 0], [1, 1, 1, 0]];
    };
    case 2: {
        "rendertarget0" setPiPEffect [2];
    };
    default {
        ERROR_1("Unknown vision mode (%1)!",_mode);
    };
};
