#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Stashes everything in the box into the player's locker (the Armory's Stash All), each class as a
 * single stash does (FUNC(lockerAction): the base variant, a disposable launcher's magazine, an
 * ACRE radio's ID, partly used magazines' rounds). What backpacks, vests and uniforms hold goes
 * into the box first, so it's stashed too. Weapons go first: the attachments and magazines they
 * leave in the box go in the second round. What the locker refuses stays in the box. Server only.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, box] call tac_apollo_fnc_lockerStashAll
 *
 * Public: No
 */

params ["_player", "_container"];

// Containers' contents into the box (a container inside another comes out empty)
{
    _x params ["", "_inner"];
    ([_inner] call FUNC(getCargo)) params ["_items", "_magazines", "_weapons", "_containers"];
    {
        _container addItemCargoGlobal [_x, 1];
    } forEach _items;
    {
        _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
    } forEach _magazines;
    {
        _container addWeaponWithAttachmentsCargoGlobal [_x, 1];
    } forEach _weapons;
    {
        _x params ["_class", "_isBackpack"];
        if (_isBackpack) then {
            _container addBackpackCargoGlobal [_class, 1];
        } else {
            _container addItemCargoGlobal [_class, 1];
        };
    } forEach _containers;
    clearItemCargoGlobal _inner;
    clearMagazineCargoGlobal _inner;
    clearWeaponCargoGlobal _inner;
    clearBackpackCargoGlobal _inner;
} forEach everyContainer _container;

private _left = [];
{
    private _cargo = call _x;
    {
        _x params ["_classes", "_counts"];
        {
            private _classBox = _x;
            ([_classBox] call EFUNC(armory,getStashVariant)) params ["_class", "_keepMagazines"];
            if !([_player, "put", _container, _class, _classBox, str (_counts select _forEachIndex), _keepMagazines, false] call FUNC(lockerAction)) then {
                _left pushBackUnique _classBox;
            };
        } forEach _classes;
    } forEach _cargo;
} forEach [
    {[getWeaponCargo _container]},
    {[getItemCargo _container, getMagazineCargo _container, getBackpackCargo _container]}
];

INFO_3("Stash all for %1: %2 left in the box %3",getPlayerUID _player,count _left,_left);
[QGVAR(lockerActionDone), [_player], _player] call CBA_fnc_targetEvent;
[QGVAR(lockerStashAllDone), [_player, _left], _player] call CBA_fnc_targetEvent;
