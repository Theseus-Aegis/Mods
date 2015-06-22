#include "script_component.hpp"

// Exit if not client or 3rd person is disabled
if (!hasInterface || {!difficultyEnabled "3rdPersonView"}) exitWith {};

// Add PFH
[{
    if (cameraView == "External" && {vehicle player == player} && {isNull (getConnectedUAV player)}) then {
        player switchCamera "Internal";
    };
}, 0.1, []] call cba_fnc_addPerFrameHandler;
