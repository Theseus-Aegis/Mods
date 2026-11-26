#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Fills an object's inventory as Minotaur sends it back (FUNC(getCargo) saved it): items,
 * magazines with their rounds, weapons with their attachments, then each container (backpack,
 * uniform, vest), added and filled with its own contents. Clears the object first.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo <ARRAY>
 *    [[[class, count], …], [[magazine, count, rounds (-1 full)], …], [[weapon items, count], …],
 *     [[class, is backpack, [items, magazines, weapons]], …]]
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, [[["FirstAidKit", 2]], [], [], []]] call tac_apollo_fnc_setCargo
 *
 * Public: No
 */

params ["_object", "_cargo"];
_cargo params [["_items", []], ["_magazines", []], ["_weapons", []], ["_containers", []]];

clearItemCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearBackpackCargoGlobal _object;

{
    _object addItemCargoGlobal _x;
} forEach _items;

{
    _x params ["_class", "_count", ["_rounds", -1]];
    if (_rounds < 0) then {
        _object addMagazineCargoGlobal [_class, _count];
    } else {
        _object addMagazineAmmoCargo [_class, _count, _rounds];
    };
} forEach _magazines;

{
    _object addWeaponWithAttachmentsCargoGlobal _x;
} forEach _weapons;

// A container is found as the one everyContainer didn't have before it was added
{
    _x params ["_class", "_isBackpack", "_contents"];
    private _before = (everyContainer _object) apply {_x select 1};
    if (_isBackpack) then {
        _object addBackpackCargoGlobal [_class, 1];
    } else {
        _object addItemCargoGlobal [_class, 1];
    };
    private _container = (((everyContainer _object) apply {_x select 1}) - _before) param [0, objNull];
    if (!isNull _container) then {
        [_container, _contents] call FUNC(setCargo);
    };
} forEach _containers;
