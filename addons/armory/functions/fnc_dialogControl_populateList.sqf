/*
 * Author: Jonpas
 * Populates lists.
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[armoryData]] call tac_armory_fnc_dialogControl_populateList
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_armoryData"];

private ["_selectedSubCategory", "_rowNum", "_configCfg", "_displayName", "_picture"];

_selectedSubCategory = lbText [DROPDOWN, (lbSelection CTRL(DROPDOWN)) select 0]; // SubCategory

TRACE_2("Populating list",_armoryData,_selectedSubCategory);

// Clear List
lnbClear NLIST;
_rowNum = 0; // Needed for proper row images

// Fill List
{
    _x params ["_className", "_subCategory", "_description", "_quantity"];

    _configCfg = "";
    if (isText (configFile >> "CfgWeapons" >> _className >> "displayName")) then {
        _configCfg = "CfgWeapons";
    };
    if (isText (configFile >> "CfgMagazines" >> _className >> "displayName")) then {
        _configCfg = "CfgMagazines";
    };
    if (isText (configFile >> "CfgVehicles" >> _className >> "displayName")) then {
        _configCfg = "CfgVehicles";
    };

    if (_selectedSubCategory == "" || {_selectedSubCategory == _subCategory}) then {
        // Set name
        _displayName = getText (configFile >> _configCfg >> _className >> "displayName"); // Get display name from config
        lnbAddRow [NLIST, ["", _displayName, _quantity]]; // Add row with information

        // Set hidden data with classname to displayName column and quantity to quantity column
        lnbSetData [NLIST, [_rowNum, 1], _className];
        lnbSetData [NLIST, [_rowNum, 2], _quantity];

        // Set picture
        _picture = getText (configFile >> _configCfg >> _className >> "picture");
        lnbSetPicture [NLIST, [_rowNum, 0], _picture];
        _rowNum = _rowNum + 1;
    };
} forEach _armoryData;

GVAR(armoryData) = _armoryData;
