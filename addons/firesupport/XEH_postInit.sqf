#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

if (hasInterface) then {
    ["ace_firedPlayer", {
        params ["_unit", "", "", "", "_ammo", "", "_projectile"];

        if !(_ammo in GVAR(signalAmmoTypes)) exitWith {};

        // Delayed for accurate projectile position.
        [{
            params ["_unit", "_ammo", "_projectile"];
            private _position = position _projectile;
            [QGVAR(startSupport), [_position, _ammo, _unit]] call CBA_fnc_serverEvent;
        }, [_unit, _ammo, _projectile], 6] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(startSupport), FUNC(handleSupport)] call CBA_fnc_addEventHandler;
};
