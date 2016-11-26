#include "script_component.hpp"

#ifdef DRAW_ATTACHPOS_INFO
GVAR(testHelper) = createVehicle ["Land_Pod_Heli_Transport_04_fuel_F", [-1000, -1000, -1000], [], 0, "NONE"];
addMissionEventHandler ["Draw3D", {
    private _attachPos = getArray (configFile >> "CfgVehicles" >> typeOf cursorObject >> QGVAR(AttachPos));
    drawIcon3D ["", [0.5, 0.5, 1, 1], ASLtoAGL getPosASL cursorObject, 0.5, 0.5, 0, format ["%1 = %2", typeOf cursorObject, _attachPos], 0.5, 0.025, "TahomaB"];
    if !(_attachPos isEqualTo []) then {
        (boundingBoxReal GVAR(testHelper)) params ["_box0", "_box1"];
        {
            _x params ["_start", "_end"];
            drawLine3D [(cursorObject modelToWorldVisual _start) vectorDiff _attachPos, (cursorObject modelToWorldVisual _end) vectorDiff _attachPos, [255, 0, 0, 1]];
            private _dynamicAttachPos = cursorObject getVariable ["tac_heavylifter_testAttachPos", [0, 0, 0]];
            drawLine3D [(cursorObject modelToWorldVisual _start) vectorDiff _dynamicAttachPos, (cursorObject modelToWorldVisual _end) vectorDiff _dynamicAttachPos, [0, 255, 0, 1]];
            false
        } count [
            [_box0, [_box1 select 0, _box0 select 1, _box0 select 2]], // Left Front Bottom -> Right Front Bottom
            [_box0, [_box0 select 0, _box1 select 1, _box0 select 2]], // Left Front Bottom -> Left Back Bottom
            [_box0, [_box0 select 0, _box0 select 1, _box1 select 2]], // Left Front Bottom -> Left Front Top
            [_box1, [_box0 select 0, _box1 select 1, _box1 select 2]], // Right Back Top -> Left Back Top
            [_box1, [_box1 select 0, _box0 select 1, _box1 select 2]], // Right Back Top -> Right Front Top
            [_box1, [_box1 select 0, _box1 select 1, _box0 select 2]], // Right Back Top -> Right Back Bottom
            [[_box1 select 0, _box1 select 1, _box0 select 2], [_box1 select 0, _box0 select 1, _box0 select 2]], // Right Back Bottom -> Right Front Bottom
            [[_box1 select 0, _box0 select 1, _box1 select 2], [_box0 select 0, _box0 select 1, _box1 select 2]], // Right Front Top -> Left Front Top
            [[_box1 select 0, _box0 select 1, _box0 select 2], [_box1 select 0, _box0 select 1, _box1 select 2]], // Right Front Bottom -> Right Front Top
            [[_box0 select 0, _box1 select 1, _box1 select 2], [_box0 select 0, _box0 select 1, _box1 select 2]], // Left Back Top -> Left Front Top
            [[_box0 select 0, _box1 select 1, _box1 select 2], [_box0 select 0, _box1 select 1, _box0 select 2]], // Left Back Top -> Left Back Bottom
            [[_box0 select 0, _box1 select 1, _box0 select 2], [_box1 select 0, _box1 select 1, _box0 select 2]] // Left Back Bottom -> Right Back Bottom
        ];
    };
}];
#endif
