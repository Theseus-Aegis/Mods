#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Lootbox functionality
[
    QGVAR(randomizedBox),
    "CONTAINER",
    LLSTRING(OpenRandomBox),
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

// Replacement Items functionality
private _replacementBaseClass = configFile >> "CfgWeapons" >> QGVAR(replacementBase);
private _replacementClasses = "inheritsFrom _x == _replacementBaseClass" configClasses (configFile >> "CfgWeapons");
{
    private _class = configName _x;
    private _itemList = getArray (configFile >> "CfgWeapons" >> _class >> QGVAR(replacementList));
    [_class, _itemList] call ACEFUNC(common,registerItemReplacement);
} forEach _replacementClasses;

// Load traits
[ace_player] call FUNC(loadTraits);
