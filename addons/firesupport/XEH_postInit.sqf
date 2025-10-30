#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

GVAR(mortarsBusy) = false;

if (hasInterface) then {
    ["ace_firedPlayer", {
        params ["_unit", "", "", "", "_ammo", "", "_projectile"];

        if !(_ammo in tac_scripts_ammoTypes) exitWith {};

        // Delayed for accurate smoke position.
        [{
            params ["_projectile", "_unit"];
            private _position = position _projectile;
            [QGVAR(mortarSupport), [_position, _unit]] call CBA_fnc_serverEvent;
        }, [_projectile, _unit], 6] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(mortarSupport), {_this call FUNC(mortarSupport)}] call CBA_fnc_addEventHandler;
};
