#include "script_component.hpp"
/*
 * Author: Jonpas
 * Close ACE Arsenal camera and cleans up all data.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_closeCamera
 *
 * Public: No
 */

ACE_player setVariable [QGVAR(inCamera), false];

// Reset to main menu
["main"] call FUNC(dialogControl);

removeMissionEventHandler ["Draw3D", GVAR(camPosUpdateHandle)];

ACEGVAR(arsenal,camera) cameraEffect ["TERMINATE", "BACK"];
ACE_player switchCamera ACEGVAR(arsenal,cameraView);

deleteVehicle ACEGVAR(arsenal,cameraHelper);
camDestroy ACEGVAR(arsenal,camera);

ACEGVAR(arsenal,camera) = nil;
ACEGVAR(arsenal,cameraHelper) = nil;
ACEGVAR(arsenal,cameraPosition) = nil;

ACEGVAR(arsenal,center) = nil;
ACEGVAR(arsenal,mouseButtonState) = nil;

[QUOTE(ADDON), []] call ACEFUNC(common,showHud);
