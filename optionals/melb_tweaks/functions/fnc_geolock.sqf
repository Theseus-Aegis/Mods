#include "script_component.hpp"
/*
 * Author: Jonpas
 * Toggles Camera Ground Lock (GEOLOCK).
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call tac_melb_tweaks_fnc_geolock
 *
 * Public: No
 */

params ["_vehicle"];

private _geolockCtrl = (uiNamespace getVariable "RscUnitInfo") displayCtrl 333;

if (_vehicle directionStabilizationEnabled [0]) then {
    LOG("geolock disable");
    _vehicle lockCameraTo [objNull, [0]];
    _vehicle enableDirectionStabilization [false, [0]];
    _geolockCtrl ctrlSetText "----";
} else {
    LOG("geolock enable");
    private _cameraBegin = _vehicle modelToWorldVisualWorld (_vehicle selectionPosition "laserstart");
    private _cameraEnd = _vehicle modelToWorldVisualWorld (_vehicle selectionPosition "commanderview");
    private _cameraDir = _cameraBegin vectorFromTo _cameraEnd;
    private _farPoint = _cameraEnd vectorAdd (_cameraDir vectorMultiply 4999);
    private _geolockPos = terrainIntersectAtASL [_cameraBegin, _farPoint];

    if (_geolockPos isNotEqualTo [0, 0, 0]) then {
        _vehicle enableDirectionStabilization [true, [0]];
        _vehicle lockCameraTo [_geolockPos, [0]];
        _geolockCtrl ctrlSetText "GEOLOCK";
    };
};

// TODO Sync geolock ?
