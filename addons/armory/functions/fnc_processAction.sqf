#include "script_component.hpp"
/*
 * Author: Jonpas
 * Processes performed action and modifies Vanilla data or sends data back to Apollo (Chronos).
 *
 * Arguments:
 * 0: Take/Stash <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["type"] call tac_armory_fnc_processAction
 *
 * Public: No
 */

params ["_type"];

// Because David likes different variables (stash == put == stash/put into locker from box, remove == take == take/remove from locker to box)
private _typeChronos = ["remove", "put"] select (_type == "stash");

private _selectedItem = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
private _selectedAmount = lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)]; // Quantity
private _object = ACE_player getVariable [QGVAR(object), objNull];

// Insignia application
if (isClass (configFile >> "CfgUnitInsignia" >> _selectedItem)) exitWith {
    [ACE_player, _selectedItem] call BIS_fnc_setUnitInsignia;
};

TRACE_3("Send data",_type,_selectedItem,_selectedAmount);

// Exit if any variable is not set
if (_selectedItem == "" || _selectedAmount == "") exitWith {
    ERROR_2("Send data called with empty variables! Item: %1, Amount: %2",_selectedItem,_selectedAmount);
};
if (isNull _object) exitWith {
    ERROR("Object is nil");
};

// Prevent taking if container is full
if (_type == "take" && {!(_object canAdd _selectedItem)}) exitWith {
    [LSTRING(ContainerFull), 2] call ACEFUNC(common,displayTextStructured);
};

if (GVAR(system) == 0) then {
    // Set box contents
    private _isBackpack = [_selectedItem] call ACEFUNC(backpacks,isBackpack);
    private _itemType = ([_selectedItem] call ACEFUNC(common,getItemType)) select 0;

    if (_type == "take") then {
        switch (true) do {
            case (_isBackpack): {
                _object addBackpackCargoGlobal [_selectedItem, parseNumber _selectedAmount];
            };
            case (_itemType == "weapon"): {
                _object addWeaponCargoGlobal [_selectedItem, parseNumber _selectedAmount];
            };
            case (_itemType == "magazine"): {
                _object addMagazineCargoGlobal [_selectedItem, parseNumber _selectedAmount];
            };
            default {
                _object addItemCargoGlobal [_selectedItem, parseNumber _selectedAmount]; //default "item"
            };
        };

        // Update list
        private _newArmoryData = [GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData);
        [_newArmoryData] call FUNC(updateData);
    } else {
        switch (true) do {
            case (_isBackpack): {
                [_object, _selectedItem, parseNumber _selectedAmount, true] call CBA_fnc_removeBackpackCargo;
            };
            case (_itemType == "weapon"): {
                [_object, _selectedItem, parseNumber _selectedAmount, true] call CBA_fnc_removeWeaponCargo;
            };
            case (_itemType == "magazine"): {
                [_object, _selectedItem, parseNumber _selectedAmount] call CBA_fnc_removeMagazineCargo;
            };
            default {
                [_object, _selectedItem, parseNumber _selectedAmount, true] call CBA_fnc_removeItemCargo; //default "item"
            };
        };

        // Update list
        [call FUNC(getBoxContents)] call FUNC(updateData);
    };

    // Set Armory contents
    private _armoryDataVar = _object getVariable [QGVAR(armoryData), []];
    private _amountChange = [_selectedAmount, format ["-%1", _selectedAmount]] select (_type == "take");

    _armoryDataVar = _armoryDataVar apply {
        if (_x select 1 == _selectedItem) then {
            [_x select 0, _x select 1, _x select 2, _x select 3, (_x select 4) + (parseNumber _amountChange)]
        } else {
            _x
        };
    };
};

if (GVAR(system) == 1) then {
    [QEGVAR(apollo,lockerAction), [player, _typeChronos, _object, _selectedItem, _selectedAmount]] call CBA_fnc_serverEvent;

    // Update list (subtract only, due to usage of CBA functions a callback event is used for full refresh when done)
    private _newArmoryData = [GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData);
    [_newArmoryData] call FUNC(updateData);

    if (_type == "stash") then {
        private _subtractOnFullRefresh = ACE_player getVariable [QGVAR(subtractOnFullRefresh), []];
        _subtractOnFullRefresh pushBack [_selectedItem, _selectedAmount];
        ACE_player setVariable [QGVAR(lastStashTime), CBA_missionTime];
        TRACE_1("Setting subtract on full refresh",_subtractOnFullRefresh);
    };
};
