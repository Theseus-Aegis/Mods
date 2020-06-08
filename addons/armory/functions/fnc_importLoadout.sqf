#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Import loadout from clipboard and put those items into a box.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_armory_fnc_importLoadout
 *
 * Public: No
 */

private _data = call (compile copyFromClipboard);
private _object = ACE_player getVariable [QGVAR(object), objNull];

if (count _data == 10) then {
    GVAR(loadoutItems) = [];
    for "_index" from 0 to 9 do {
        switch (_index) do {
            case 0: {
                private _rifleElement = _data select _index;
                if (count _rifleElement > 0) then {
                    {
                        _x params ["_element"];

                        if (typeName _element == "ARRAY") then {
                            GVAR(loadoutItems) pushBack (_element select 0);
                        } else {
                            GVAR(loadoutItems) pushBack _element;
                        };
                    } forEach _rifleElement;
                };
            };
            case 1: {
                private _launcherElement = _data select _index;
                if (count _launcherelement > 0) then {
                    {
                        _x params ["_element"];

                        if (typeName _element == "ARRAY") then {
                            GVAR(loadoutItems) pushBack (_element select 0);
                        } else {
                            GVAR(loadoutItems) pushBack _element;
                        };
                    } forEach _launcherelement;
                };
            };
            case 2: {
                private _pistolElement = _data select _index;
                if (count _pistolElement > 0) then {
                    {
                        _x params ["_element"];

                        if (typeName _element == "ARRAY") then {
                            GVAR(loadoutItems) pushBack (_element select 0);
                        } else {
                            GVAR(loadoutItems) pushBack _element;
                        };
                    } forEach _pistolElement;
                };
            };
            case 3: {
                private _uniformElement = _data select _index;
                if (count _uniformElement > 0) then {
                    GVAR(loadoutItems) pushBack (_uniformElement select 0);
                    private _uniformItemElement = _uniformElement select 1;
                    {
                        _x params ["_classname", "_amount"];

                        for _classname from 1 to _amount do {
                            GVAR(loadoutItems) pushBack _classname;
                        };
                    } forEach _uniformItemElement;
                };
            };
            case 4: {
                private _vestElement = _data select _index;
                if (count _vestElement > 0) then {
                    GVAR(loadoutItems) pushBack (_vestElement select 0);
                    private _uniformItemElement = _vestElement select 1;
                    {
                        _x params ["_classname", "_amount"];

                        for _classname from 1 to _amount do {
                            GVAR(loadoutItems) pushBack _classname;
                        };
                    } forEach _uniformItemElement;
                };
            };
            case 5: {
                private _backpackElement = _data select _index;
                if (count _backpackElement > 0) then {
                    GVAR(loadoutItems) pushBack (_backpackElement select 0);
                    private _uniformItemElement = _backpackElement select 1;
                    {
                        _x params ["_classname", "_amount"];

                        for _classname from 1 to _amount do {
                            GVAR(loadoutItems) pushBack _classname;
                        };
                    } forEach _uniformItemElement;
                };
            };
            case 6: {
                GVAR(loadoutItems) pushBack (_data select _index);
            };
            case 7: {
                GVAR(loadoutItems) pushBack (_data select _index);
            };
            case 8: {
                private _binocularElement = _data select _index;
                if (count _binocularElement > 0) then {
                    {
                        _x params ["_element"];

                        if (typeName _element == "ARRAY") then {
                            GVAR(loadoutItems) pushBack (_element select 0);
                        } else {
                            GVAR(loadoutItems) pushBack _element;
                        };
                    } forEach _binocularElement;
                };
            };
            case 9: {
                private _utilityItemElement = _data select _index;
                {
                    _x params ["_classname"];

                    GVAR(loadoutItems) pushBack _classname;
                } forEach _utilityItemElement;
            };
        };
    };
};

// Final array of items in the unitLoadout provided (["item","item"])
GVAR(loadoutItems) = [GVAR(loadoutItems), {_this in [""]}] call CBA_fnc_reject;

// Sort loadoutItems (["item",amount],["item",amount])
private _sortedLoadoutItems = [];
{
    _x params ["_item"];

    private _itemCount = {_item isEqualTo _x} count GVAR(loadoutItems);
    _sortedLoadoutItems pushBackUnique [_item, _itemCount];
} forEach GVAR(loadoutItems);

diag_log _sortedLoadoutItems;

// All items currently in locker ([["classname","category","description","amount","?"],["classname","category","description","amount","?"]])
private _lockerItems = ["all"] call tac_armory_fnc_getDataChronos;

// Make array to be searched through
private _lockerSearchItems = _lockerItems apply {_x select 0};

// Check if items are in locker
private _itemsToExport = [];
private _allItemsAvailable = true;
{
    _x params ["_item", "_amount"];

    _lockerSearchItems = _lockerSearchItems apply {configName (_x call CBA_fnc_getItemConfig)};

    if (_item in _lockerSearchItems) then {
        // item is in locker!
        private _foundItemIndex = _lockerSearchItems find _item;
        private _lockerItemAmount = parseNumber ((_lockerItems select _foundItemIndex) select 3);

        if (_lockerItemAmount >= _amount) then {
            _itemsToExport pushBack [_item, _amount];
        } else {
            format ["Failed to get loadout, not enough of: %1", _item] call CBA_fnc_notify;
            _allItemsAvailable = false;
        };
    } else {
        // item not in locker
        format ["Failed to get loadout, missing: %1", _item] call CBA_fnc_notify;
        _allItemsAvailable = false;
    };
} forEach _sortedLoadoutItems;

if (_allItemsAvailable isEqualTo true) then {
    {
        _x params ["_item", "_amount"];

        [player, "remove", _object, _item, _item, _amount] call tac_apollo_fnc_lockerAction;
    } forEach _itemsToExport;
    ["Successfully put loadout in box!"] call CBA_fnc_notify;
};
