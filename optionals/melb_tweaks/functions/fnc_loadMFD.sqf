#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Loads and initializes MFD.
 *
 * Arguments:
 * 0: RscInGameUI Display <DISPLAY> (unused)
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call tac_melb_tweaks_fnc_loadMFD
 *
 * Public: No
 */

private _vehicle = vehicle (call CBA_fnc_currentUnit);
LOG_1("load MFD: %1",_vehicle);

// Sometimes (eg. spawning into a unit) this runs twice, but if second camera is created, old one will get stuck and no MFD updates will happen
if (!isNil QGVAR(camera)) then {
    LOG("unloading duplicate MFD");
    [_vehicle] call FUNC(unloadMFD);
};

// Setup Render2Texture with Render Target (camera)
GVAR(camera) = "camera" camCreate [0, 0, 0];
GVAR(camera) attachTo [_vehicle, [0, 0, 0], "commanderview"];

// Keep pointing the local camera to camera's target
private _drawID = addMissionEventHandler ["Draw3D", {
    _thisArgs params ["_vehicle"];
    private _dir = (_vehicle selectionPosition "laserstart") vectorFromTo (_vehicle selectionPosition "commanderview");
    GVAR(camera) setVectorDirAndUp [_dir, _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
}, [_vehicle]];
_vehicle setVariable [QGVAR(drawID), _drawID];

[_vehicle] call FUNC(setupMFD);
