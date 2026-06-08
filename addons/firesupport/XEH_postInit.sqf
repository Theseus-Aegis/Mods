#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

if (hasInterface) then {
    ["ace_firedPlayer", {
        params ["_unit", "", "", "", "_ammo", "", "_projectile"];

        if !(_ammo in GVAR(ammoTypes)) exitWith {};

        // Delayed for accurate projectile position.
        [{
            params ["_projectile", "_unit"];
            private _position = position _projectile;
            [QGVAR(mortarSupport), [_position, _unit]] call CBA_fnc_serverEvent;
        }, [_projectile, _unit], 6] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(mortarSupport), FUNC(mortarSupport)] call CBA_fnc_addEventHandler;
};
