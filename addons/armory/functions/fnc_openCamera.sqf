#include "script_component.hpp"
/*
 * Author: Jonpas
 * Sets up ACE Arsenal camera without any other interface.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_openCamera
 *
 * Public: No
 */

ACE_player setVariable [QGVAR(inCamera), true];

// Hide All
for "_x" from STARTPROJECTID to ENDPROJECTID do {
    ctrlShow [_x, false];
};

// Show control with camera keys and focus on it
ctrlShow [CAMERAAREA, true];

// Prepare
ACEGVAR(arsenal,center) = ACE_player;
ACEGVAR(arsenal,mouseButtonState) = [[], []];

ACEGVAR(arsenal,cameraView) = cameraView;
ACEGVAR(arsenal,center) switchCamera "INTERNAL";

[QUOTE(ADDON), [false, true, true, true, true, true, true, false, true, true]] call ACEFUNC(common,showHud);

// Initialize
ACEGVAR(arsenal,cameraPosition) = [5, 0, 0, [0, 0, 0.85]];

ACEGVAR(arsenal,cameraHelper) = createAgent ["Logic", position ACEGVAR(arsenal,center), [], 0, "NONE"];
ACEGVAR(arsenal,cameraHelper) attachTo [ACEGVAR(arsenal,center), ACEGVAR(arsenal,cameraPosition) select 3, ""];

ACEGVAR(arsenal,camera) = "camera" camCreate position ACEGVAR(arsenal,center);
ACEGVAR(arsenal,camera) cameraEffect ["INTERNAL", "BACK"];
ACEGVAR(arsenal,camera) camPrepareFocus [-1, -1];
ACEGVAR(arsenal,camera) camPrepareFov 0.35;
ACEGVAR(arsenal,camera) camCommitPrepared 0;

showCinemaBorder false;

// Reset position
[nil, [controlNull, 0, 0]] call ACEFUNC(arsenal,handleMouse);
GVAR(camPosUpdateHandle) = addMissionEventHandler ["Draw3D", ACEFUNC(arsenal,updateCamPos)];

// Show hint on how to exit
(localize LSTRING(CameraHint)) call CBA_fnc_notify;
