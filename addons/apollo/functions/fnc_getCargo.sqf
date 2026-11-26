#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns what's in an object's inventory, for saving: items, magazines with their rounds,
 * weapons with their attachments and loaded magazines, and containers (backpacks, uniforms,
 * vests) with what's in them.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * [items, magazines, weapons, containers] <ARRAY>
 *
 * Example:
 * [vehicle] call tac_apollo_fnc_getCargo
 *
 * Public: No
 */

params ["_object"];

private _items = itemCargo _object;
private _containers = (everyContainer _object) apply {
    _x params ["_class", "_container"];
    private _isBackpack = getNumber (configFile >> "CfgVehicles" >> _class >> "isBackpack") == 1;
    // Uniforms and vests are also in itemCargo: saved as containers only
    if (!_isBackpack) then {
        private _index = _items find _class;
        if (_index != -1) then {
            _items deleteAt _index;
        };
    };
    [_class, _isBackpack, [itemCargo _container, magazinesAmmoCargo _container, weaponsItemsCargo _container]]
};

[_items, magazinesAmmoCargo _object, weaponsItemsCargo _object, _containers]
