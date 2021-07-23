#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

[QGVAR(setTraits), {
    params ["_player", "_trait"];

    _player setUnitTrait [_trait, true];
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), ace_player] call CBA_fnc_serverEvent;

// Lootbox functionality
[
    QGVAR(replacementBox),
    "CONTAINER",
    LLSTRING(OpenLootbox),
    [],
    "",
    {true},
    {
        params ["_unit", "", "_item", "_slot"];

        private _container = switch (_slot) do { // This is temporary due to weapons getting replaced see ACE3 issue #8328
            case "UNIFORM_CONTAINER": {"uniform"};
            case "VEST_CONTAINER": {"vest"};
            case "BACKPACK_CONTAINER": {"backpack"};
        };

        private _itemList = getArray (configFile >> "CfgWeapons" >> _item >> QGVAR(possibleItems));

        [_unit, selectRandom _itemList, _container] call ACEFUNC(common,addToInventory);
    },
    true
] call CBA_fnc_addItemContextMenuOption;
