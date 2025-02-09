#include "script_component.hpp"

[] call FUNC(arsenal_postInit);

// Clear inventory of a container
[QGVAR(clearAllCargo), {call FUNC(clearAllCargo)}] call CBA_fnc_addEventHandler;
// Clear inventory of every backpack in a container
[QGVAR(clearCargoBackpacks), {call FUNC(clearCargoBackpacks)}] call CBA_fnc_addEventHandler;

// Backpack classnames which will be made invisible instead of being made a chestpack. Useful for items like the vanilla legstrap.
GVAR(exceptions) = [
    "B_LegStrapBag_black_F",
    "B_LegStrapBag_coyote_F",
    "B_LegStrapBag_olive_F"
];

if (isServer) exitWith {};

[QGVAR(handleDisconnect), {
    addMissionEventHandler ["HandleDisconnect", FUNC(EHHandleDisconnect)];
}] call CBA_fnc_addEventHandler;

// holding the backpack have landed
[QGVAR(checkLandedPFH), {
    params ["_ropeTop", "_holder"];

    // PFH to check when the helper object _ropeTop and the WeaponHolderSimulated
    [{
        params ["_ropeTop", "_handle"];

        if (speed _ropeTop < 1 && {((getPos _ropeTop) select 2) < 1}) exitWith {
            deleteVehicle _ropeTop;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, _ropeTop] call CBA_fnc_addPerFrameHandler;

    [{
        params ["_holder", "_handle"];
        if (speed _holder < 1 && {getPos _holder # 2 < 1}) exitWith {
            private _pos = getPos _holder;
            _pos set [2, 0];
            _holder setPos _pos;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, _holder] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
